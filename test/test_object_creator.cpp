/**
 * @file test_object_creator.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-07-03
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#include "shc/object_creator.hpp"
#include "shc/shared_memory_allocator/allocator.hpp"

#include <iostream>

template<class Allocator>
struct BuiltIn {
    BuiltIn() 
        : p1(100)
        , p2(20.1)
        , p3('z')
        , p4('z')
        , p5(0)
    { }
    BuiltIn(const Allocator&) : BuiltIn() { }

    int p1;
    float p2;
    char p3;
    char p4;
    short p5;
};

template<class Allocator>
struct Array {
    Array() { }
    Array(const Allocator&) { }

    unsigned long size;
    int data[100];
};

template<typename STRUCT>
STRUCT test_object_creator(const STRUCT& input)
{
    std::cout << "sizeof(STRUCT): " << sizeof(STRUCT) << std::endl;

    SharedMemoryPosixAllocator<char> alloc("test_object_creator_obj");
    SharedMemoryObjectCreator<STRUCT, SharedMemoryPosixAllocator> obj_creator("test_object_creator");
    STRUCT* obj = obj_creator.template instance<char>(alloc);
    *obj = input;

    SharedMemoryObjectCreator<STRUCT, SharedMemoryPosixAllocator> obj_creator_read("test_object_creator");
    STRUCT* obj_read = obj_creator_read.reserve();
    return *obj_read;
}

int main()
{
    std::cout << "============ TEST BuiltIn ===========" << std::endl;
    BuiltIn<SharedMemoryPosixAllocator<char>> built_in;
    built_in.p1 = 10;
    // built_in.p2 = 1.2;
    built_in.p3 = 'a';
    built_in.p4 = 'b';
    built_in.p5 = 1;
    auto built_in_ret = test_object_creator<BuiltIn<SharedMemoryPosixAllocator<char>>>(built_in);
    std::cout << "built_in_ret.p1: " << built_in_ret.p1 << std::endl;
    std::cout << "built_in_ret.p2: " << built_in_ret.p2 << std::endl;
    std::cout << "built_in_ret.p3: " << built_in_ret.p3 << std::endl;
    std::cout << "built_in_ret.p4: " << built_in_ret.p4 << std::endl;
    std::cout << "built_in_ret.p5: " << built_in_ret.p5 << std::endl;

    std::cout << "============ TEST Array ===========" << std::endl;
    Array<SharedMemoryPosixAllocator<char>> array;
    array.size = 10;
    for (std::size_t i = 0; i < array.size; ++i)
    {
        array.data[i] = i * 2;
    }
    auto array_ret = test_object_creator<Array<SharedMemoryPosixAllocator<char>>>(array);
    std::cout << "array_ret.size: " << array_ret.size << std::endl;
    std::cout << "array_ret.data: ";
    for (std::size_t i = 0; i < array.size; ++i)
    {
        std::cout << array.data[i] << ", ";
    }
    std::cout << std::endl;
}