#include "shc/test/iceoryx_pub.hpp"
#include "shc/test/iceoryx_sub.hpp"
#include "shc/test/test.hpp"

#include <chrono>
#include <thread>


int main(int argc, char *argv[])
{
    if (argc < 4)
    {
        std::cout << "arguments error" << std::endl;
        return -1;
    }
    auto id = std::string(argv[1]);
    int num_pub = atoi(argv[2]);
    int num_sub = atoi(argv[3]);
    std::cout << "num_pub: " << num_pub << std::endl;
    std::cout << "num_sub: " << num_sub << std::endl;

    int iter = 0;
    for (const auto& s: SIZES_TO_TEST)
    {
        std::cout << "Test " << s << std::endl;
        setvbuf(stdout, NULL, _IONBF, BUFSIZ);
        rclcpp::init(argc, argv);
        rclcpp::executors::MultiThreadedExecutor executor;
        bool call_shutdown = true;

        std::vector<Pub::SharedPtr> producers;
        for (int i = 0; i < num_pub; ++i)
        {
            auto producer = std::make_shared<Pub>(id + "_p" + std::to_string(iter) + std::to_string(i), s, NUM_ITER, call_shutdown);
            producers.push_back(producer);
            call_shutdown = false;
        }
        std::vector<Pub::SharedPtr> subscribers;
        for (int i = 0; i < num_sub; ++i)
        {
            auto subscriber = std::make_shared<Sub>(id + "_s" + std::to_string(iter) + std::to_string(i), s, NUM_ITER, call_shutdown);
            subscribers.push_back(subscriber);
            call_shutdown = false;
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(10));
        for(auto& p: producers) executor.add_node(p);
        for(auto& s: subscribers) executor.add_node(s);

        executor.spin();
        rclcpp::shutdown();

        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        iter++;
    }
    
    return 0;
}