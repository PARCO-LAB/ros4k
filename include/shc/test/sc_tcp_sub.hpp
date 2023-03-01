#include <memory>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include "shc/msg/data.hpp"

#include "parco/analysis.hpp"


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
        _subscription = this->create_subscription<shc::msg::Data>(
            "data" + std::to_string(length), rclcpp::QoS(1).reliable(), [this](const shc::msg::Data::SharedPtr msg) {
                RCLCPP_INFO(this->get_logger(), "I heard: size %zu frame %d", 
                    msg->arr.data.size(), msg->header.frame_id);

                auto msg_time = std::chrono::nanoseconds(msg->header.timestamp);
                auto t = std::chrono::high_resolution_clock::now().time_since_epoch();
                std::chrono::duration<double, std::milli> elapsed = t - msg_time;
                _latency.values().push_back(elapsed.count());
                if (!_first)
                {
                    _inter_time_arrival.stop();
                }
                _first = false;

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
        _matrix_analysis.dump_values("sc_tcp_" + _id + "_" + std::to_string(_length));
        _matrix_analysis.dump_analysis("sc_tcp_" + _id + "_" + std::to_string(_length));
    }

private:
    rclcpp::Subscription<shc::msg::Data>::SharedPtr _subscription;
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
