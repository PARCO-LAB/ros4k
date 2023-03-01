#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "shc/msg/data.hpp"

#include "shc/benchmark/benchmark.hpp"


using namespace std::chrono_literals;


class Pub : public rclcpp::Node
{
public:
    Pub(std::string id, std::size_t length, std::size_t num_iter = 1, bool call_shutdown = true)
        : Node("pub"+id), count_(0), _length(length), _num_iter(num_iter), _call_shutdown(call_shutdown)
    {
        _publisher = this->create_publisher<shc::msg::Data>("data" + std::to_string(length), rclcpp::QoS(1).best_effort());
        _publisher_exit = this->create_publisher<shc::msg::Header>("exit" + std::to_string(length), rclcpp::QoS(1).reliable());
        _timer = this->create_wall_timer(500ms, std::bind(&Pub::timer_callback, this));
    }

private:
    void timer_callback()
    {
        auto message = shc::msg::Data();
        init<float>(message.arr.data, _length);
        RCLCPP_INFO(this->get_logger(), "Publishing: size %zu", message.arr.data.size());
        message.header.timestamp = std::chrono::high_resolution_clock::now().time_since_epoch().count();
        message.header.frame_id = count_;
        _publisher->publish(std::move(message));

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
    rclcpp::Publisher<shc::msg::Data>::SharedPtr _publisher;
    rclcpp::Publisher<shc::msg::Header>::SharedPtr _publisher_exit;
    size_t count_;
    size_t _length;
    size_t _num_iter;
    bool _call_shutdown;
};