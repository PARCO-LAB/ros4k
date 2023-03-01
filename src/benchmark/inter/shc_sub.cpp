#include "shc/test/shc_sub.hpp"
#include "shc/test/test.hpp"

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
        rclcpp::spin(std::make_shared<Sub>(p, s, NUM_ITER));
        rclcpp::shutdown();
    }
    return 0;
}