#include <memory>
#include <chrono>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include "std_msgs/msg/int64.hpp"
#include "std_msgs/msg/float32_multi_array.hpp"

#include "shc/msg/header.hpp"
#include "shc/msg/token.hpp"
#include "shc/msg/data.hpp"
#include "shc/shared_memory_allocator/allocator.hpp"
#include "shc/object_creator.hpp"

#include "parco/analysis.hpp"

using Alloc = SharedMemoryPosixAllocator<void>;


class Sub : public rclcpp::Node
{
public:
    Sub(std::string id, std::size_t length, std::size_t num_iter = 1, bool call_shutdown = true)
        : Node("sub" + id), _id(id), _first(true), _latency(), _inter_time_arrival()
        , _matrix_analysis({
            {"latency", _latency.values()},
            {"inter_time_arrival", _inter_time_arrival.values()}
        }), _length{length}, _num_iter(num_iter), count_(0), _call_shutdown(call_shutdown)
    {
        _subscription = this->create_subscription<shc::msg::Token>(
            "data" + std::to_string(length), 1, [this](const shc::msg::Token::SharedPtr msg) {
                RCLCPP_INFO(this->get_logger(), "I heard: '%s' of size %zu frame %d", 
                    msg->shm_descriptor.c_str(), msg->shm_size, msg->header.frame_id);
                
                auto msg_time = std::chrono::nanoseconds(msg->header.timestamp);
                auto t = std::chrono::high_resolution_clock::now().time_since_epoch();
                std::chrono::duration<double, std::milli> elapsed = t - msg_time;
                _latency.values().push_back(elapsed.count());
                if (!_first)
                {
                    _inter_time_arrival.stop();
                }
                _first = false;
                auto shm_name = msg->shm_descriptor;
                auto shm_size = msg->shm_size;

                std_msgs::msg::Float32MultiArray count;
                count.data.resize(shm_size);

                Alloc alloc(shm_name + "_obj");
                // SharedMemoryObjectCreator<shc::msg::Data_<Alloc>::_arr_type::_data_type, SharedMemoryPosixAllocator> obj_creator(shm_name);
                // shc::msg::Data_<Alloc>::_arr_type::_data_type* shm_msg = obj_creator.instance<void>(alloc);
                shc::msg::Data_<Alloc>::_arr_type::_data_type shm_msg(alloc);
                shm_msg.reserve(shm_size);

                std::copy(shm_msg.begin(), shm_msg.end(), count.data.begin());
                // obj_creator.free(shm_msg);
                count_ = msg->header.frame_id;

                _inter_time_arrival.start();
            });

        _subscription_exit = this->create_subscription<shc::msg::Header>("exit" + std::to_string(length), 1, 
            [this](const shc::msg::Header::SharedPtr msg) {
                RCLCPP_INFO(this->get_logger(), "Exit");
                if (_call_shutdown) rclcpp::shutdown();
            });
    }

    ~Sub()
    {
        _matrix_analysis.dump_values("shc_" + _id + "_" + std::to_string(_length));
        _matrix_analysis.dump_analysis("shc_" + _id + "_" + std::to_string(_length));
    }

private:
    rclcpp::Subscription<shc::msg::Token>::SharedPtr _subscription;
    rclcpp::Subscription<shc::msg::Header>::SharedPtr _subscription_exit;

    std::string _id;
    bool _first;
    parco::analysis::TimeVector<> _latency;
    parco::analysis::TimeVector<> _inter_time_arrival;
    parco::analysis::Matrix<double> _matrix_analysis;
    std::size_t _length;
    size_t _num_iter;
    size_t count_;
    bool _call_shutdown;
};
