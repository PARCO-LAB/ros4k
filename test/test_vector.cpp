/**
 * @file test_vector.cpp
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
#include <vector>

template<typename A>
void test_allocator()
{
    std::vector<int, A> v;
    std::cout << "v resize" << std::endl;
    v.resize(2);
    v.resize(4);

    std::cout << "v fill" << std::endl;
    for (std::size_t i = 0; i < 4; ++i)
    {
        v[i] = i;
    }

    std::cout << "v push" << std::endl;
    for (std::size_t i = 4; i < 20; ++i)
    {
        std::cout << "v push: " << i << std::endl;
        v.insert(std::end(v), i);
        //v.push_back(i);
    }

    std::cout << "v: ";
    std::size_t i;
    for (i = 0; i < 19; ++i)
    {
        std::cout << v[i] << ", ";
    }
    std::cout << v[i] << ";" << std::endl;

    std::vector<int, A> v3;
    v3.reserve(20);
    std::cout << "v3: ";
    for (i = 0; i < 19; ++i)
    {
        std::cout << v3[i] << ", ";
    }
    std::cout << v3[i] << ";" << std::endl;

    std::cout << "v copy v2" << std::endl;
    std::vector<int, A> v2;
    v2 = v;
    std::cout << "v2: ";
    for (i = 0; i < 19; ++i)
    {
        std::cout << v2[i] << ", ";
    }
    std::cout << v2[i] << ";" << std::endl;
}

template<typename A>
void test_object_creator()
{
    {
        std::cout << "sizeof(std::vector<int, A>): " 
            << sizeof(std::vector<int, A>) << std::endl;
        A alloc("test_vector_obj");
        SharedMemoryObjectCreator<std::vector<int, A>, SharedMemoryPosixAllocator> shm_obj_creator("test_vector");
        std::vector<int, A>* vec = shm_obj_creator.template instance<int>(alloc);
        vec->resize(20);
        for (std::size_t i = 0; i < 20; ++i)
        {
            vec->operator[](i) = i*2;
        }
        std::cout << "vec: ";
        for (std::size_t i = 0; i < 20; ++i)
        {
            std::cout << vec->operator[](i) << ", ";
        }
        std::cout << std::endl;
        shm_obj_creator.free(vec);
    }
    {
        A alloc("test_vector_obj");
        SharedMemoryObjectCreator<std::vector<int, A>, SharedMemoryPosixAllocator> shm_obj_creator_read("test_vector");
        std::vector<int, A>* vec_read = shm_obj_creator_read.template instance<int>(alloc);
        vec_read->reserve(20);
        std::cout << "vec_read: ";
        for (std::size_t i = 0; i < 20; ++i)
        {
            std::cout << vec_read->operator[](i) << ", ";
        }
        std::cout << std::endl;
        shm_obj_creator_read.free(vec_read);
    }
}

int main()
{
    std::cout << "============ TEST PosixShmAllocator ===========" << std::endl;
    test_allocator<SharedMemoryPosixAllocator<int>>();

    std::cout << "============ TEST SharedMemoryObjectCreator<PosixShmAllocator> ===========" << std::endl;
    test_object_creator<SharedMemoryPosixAllocator<int>>();
}