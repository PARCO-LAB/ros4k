#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "shc/msg/data.hpp"
#include "sensor_msgs/msg/image.hpp"

#include "shc/benchmark/benchmark.hpp"

#include <sl/Camera.hpp>


using namespace std::chrono_literals;

cv::Mat slMat2cvMat(sl::Mat& input) {
    return cv::Mat(input.getHeight(), input.getWidth(), 
        getOCVtype(input.getDataType()), 
        input.getPtr<sl::uchar1>(sl::MEM::CPU), 
        input.getStepBytes(sl::MEM::CPU));
}

class Zed : public rclcpp::Node
{
public:
    Zed(std::string id, std::size_t num_iter = 1, bool call_shutdown = true, std::string path = std::string())
        : Node("zed_pub"+id)
        , _zed()
        , count_(0)
        , _num_iter(num_iter)
        , _call_shutdown(call_shutdown)
    {
        _publisher_rgb = this->create_publisher<sensor_msgs::msg::Image>("rgb", rclcpp::QoS(1).reliable());
        _publisher_depth = this->create_publisher<sensor_msgs::msg::Image>("depth", rclcpp::QoS(1).reliable());
        _publisher_exit = this->create_publisher<shc::msg::Header>("exit", rclcpp::QoS(1).reliable());
        _timer = this->create_wall_timer(500ms, std::bind(&Zed::timer_callback, this));

        sl::PositionalTrackingParameters tracking_parameters;
        tracking_parameters.set_as_static = true;

        // Set configuration parameters
        sl::InitParameters init_parameters;
        init_parameters.camera_disable_self_calib = true;
        init_parameters.camera_resolution = sl::RESOLUTION::HD2K; 
        init_parameters.camera_fps = 15;
        init_parameters.depth_mode = sl::DEPTH_MODE::PERFORMANCE;
        init_parameters.coordinate_units = sl::UNIT::MILLIMETER;
        init_parameters.depth_stabilization = true;
        if (!path.empty())
        {
            init_parameters.input.setFromSVOFile(path.c_str());
        }

        auto returned_state = zed.open(init_parameters);
        if (returned_state != sl::ERROR_CODE::SUCCESS) {
            std::cout << "Error " << returned_state 
                << ", exit program." << std::endl;
            throw std::runtime_error("ZED open error");
        }
        returned_state = zed.enablePositionalTracking(tracking_parameters);
        if (returned_state != sl::ERROR_CODE::SUCCESS) {
            std::cout << "Error " << returned_state 
                << ", exit program." << std::endl;
            throw std::runtime_error("ZED open error");
        }
    }

private:
    void timer_callback()
    {
        RCLCPP_INFO(this->get_logger(), "Publishing: zed stream");

        sl::RuntimeParameters runtime_parameters;
        runtime_parameters.sensing_mode = sl::SENSING_MODE::STANDARD;

        sl::Resolution image_shape = _zed.getCameraInformation().camera_configuration.resolution;
        sl::Mat image(image_shape.width, image_shape.height, sl::MAT_TYPE::U8_C4);
        cv::Mat image_cv = slMat2cvMat(image);
        sl::Mat depth(image_shape.width, image_shape.height, sl::MAT_TYPE::F32_C1); //< With retrieveMeasure
        // sl::Mat depth(image_shape.width, image_shape.height, sl::MAT_TYPE::U16_C1); //< With retrieveMeasure
        // sl::Mat depth(image_shape.width, image_shape.height, sl::MAT_TYPE::U8_C4); // With retrieveImage.
        cv::Mat depth_cv = slMat2cvMat(depth);


        returned_state = _zed.grab(runtime_parameters);
        // A new image is available if grab() returns ERROR_CODE::SUCCESS
        if (returned_state != sl::ERROR_CODE::SUCCESS) {
            return;
        }

        _zed.retrieveImage(image, sl::VIEW::LEFT, sl::MEM::CPU);
        _zed.retrieveMeasure(depth, sl::MEASURE::DEPTH, sl::MEM::CPU); //< With retrieveMeasure.
        // zed.retrieveMeasure(depth, sl::MEASURE::DEPTH_U16_MM, sl::MEM::CPU); //< With retrieveMeasure.
        // zed.retrieveImage(depth, sl::VIEW::DEPTH, sl::MEM::CPU); //< With retrieveImage.


        sensor_msgs::msg::Image rgb_msg;
        sensor_msgs::msg::Image depth_msg;
        
        if ((count_+1) >= _num_iter)
        {
            _timer->cancel();
            _publisher_exit->publish(shc::msg::Header());
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            if (_call_shutdown) rclcpp::shutdown();
        }
        count_++;
    }

    sl::Camera _zed;
    rclcpp::TimerBase::SharedPtr _timer;
    rclcpp::Publisher<sensor_msgs::msg::Image>::SharedPtr _publisher_rgb;
    rclcpp::Publisher<sensor_msgs::msg::Image>::SharedPtr _publisher_depth;
    rclcpp::Publisher<shc::msg::Header>::SharedPtr _publisher_exit;
    size_t count_;
    size_t _length;
    size_t _num_iter;
    bool _call_shutdown;
};