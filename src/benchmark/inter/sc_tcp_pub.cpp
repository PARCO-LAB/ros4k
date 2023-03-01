#include "shc/test/sc_tcp_pub.hpp"
#include "shc/test/test.hpp"

#include <chrono>
#include <thread>

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        std::cout << "arguments error" << std::endl;
        return -1;
    }
    char * p = argv[1];

    for (const auto& s: SIZES_TO_TEST)
    {
        std::cout << "Test " << s << std::endl;
        rclcpp::init(argc, argv);
        rclcpp::spin(std::make_shared<Pub>(p, s, NUM_ITER));
        rclcpp::shutdown();

        std::this_thread::sleep_for(std::chrono::milliseconds(500));
    }
    
    return 0;
}