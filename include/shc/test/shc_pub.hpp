#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/int64.hpp"
#include "std_msgs/msg/string.hpp"
#include "std_msgs/msg/float32_multi_array.hpp"

#include "shc/msg/header.hpp"
#include "shc/msg/token.hpp"
#include "shc/msg/data.hpp"
#include "shc/shared_memory_allocator/allocator.hpp"
#include "shc/object_creator.hpp"

#include "shc/benchmark/benchmark.hpp"


using namespace std::chrono_literals;

using Alloc = SharedMemoryPosixAllocator<void>;

class Pub : public rclcpp::Node
{
public:
    Pub(std::string id, std::size_t length, std::size_t num_iter = 1, bool call_shutdown = true)
        : Node("pub" + id), count_(0), _length(length), _num_iter(num_iter), _call_shutdown(call_shutdown)
    {
        _publisher = this->create_publisher<shc::msg::Token>("data" + std::to_string(length), 1);
        _publisher_exit = this->create_publisher<shc::msg::Header>("exit" + std::to_string(length), rclcpp::QoS(1).reliable());
        _timer = this->create_wall_timer(500ms, std::bind(&Pub::timer_callback, this));
    }

private:
    void timer_callback()
    {
        auto message = std_msgs::msg::Float32MultiArray();

        init<float>(message.data, _length);
        RCLCPP_INFO(this->get_logger(), "Publishing: size '%zu'", message.data.size());
        auto shm_name = std::string(get_name()) + &_publisher->get_topic_name()[1] + std::to_string(count_);
        
        Alloc alloc(shm_name + "_obj");
        // SharedMemoryObjectCreator<shc::msg::Data_<Alloc>::_arr_type::_data_type, SharedMemoryPosixAllocator> obj_creator(shm_name);
        // shc::msg::Data_<Alloc>::_arr_type::_data_type* shm_msg = obj_creator.instance<void>(alloc);
        shc::msg::Data_<Alloc>::_arr_type::_data_type shm_msg(alloc);
        shm_msg.resize(message.data.size());
        std::copy(message.data.begin(), message.data.end(), shm_msg.begin());
        // obj_creator.free(shm_msg);

        auto token = shc::msg::Token();
        token.header.timestamp = std::chrono::high_resolution_clock::now().time_since_epoch().count();
        token.header.frame_id = count_;
        token.shm_descriptor = shm_name;
        token.shm_size = message.data.size();
        _publisher->publish(std::move(token));

        if ((count_+1) >= _num_iter)
        {
            _timer->cancel();
            _publisher_exit->publish(shc::msg::Header());
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            if (_call_shutdown) rclcpp::shutdown();
        }
        count_++;
    }
    rclcpp::TimerBase::SharedPtr _timer;
    rclcpp::Publisher<shc::msg::Token>::SharedPtr _publisher;
    rclcpp::Publisher<shc::msg::Header>::SharedPtr _publisher_exit;
    size_t count_;
    size_t _length;
    size_t _num_iter;
    bool _call_shutdown;
};