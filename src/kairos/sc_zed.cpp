#include "shc/kairos/sc_zed.hpp"

#include <chrono>
#include <thread>

int main(int argc, char *argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<Zed>("0", 10));
    rclcpp::shutdown();
    
    return 0;
}