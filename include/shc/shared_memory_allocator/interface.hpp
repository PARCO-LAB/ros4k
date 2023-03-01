/**
 * @file shc/shared_memory_allocator/interface.hpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-07-01
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef SHC_SHARED_MEMORY_ALLOCATOR_INTERFACE_HPP
#define SHC_SHARED_MEMORY_ALLOCATOR_INTERFACE_HPP

#include <cstddef>
#include <memory>
#include <iostream>


template<typename T>
class AllocatorInterface 
{
public: 
    using value_type = T;
    using pointer = T *;
    using const_pointer = const T *;
    using size_type = std::size_t;
    using difference_type = 
        typename std::pointer_traits<pointer>::difference_type;
    using reference = T&;
    using const_reference = const T&;
};

template<>
class AllocatorInterface<void> 
{ 
public: 
    using value_type = void;
    using pointer = void *;
    using const_pointer = const void *;
    using size_type = std::size_t;
    using difference_type = 
        typename std::pointer_traits<pointer>::difference_type;
};


template<typename T>
class SharedMemoryAllocatorInterface : public AllocatorInterface<T> 
{
public: 
    using value_type = typename AllocatorInterface<T>::value_type;
    using pointer = typename AllocatorInterface<T>::pointer;
    using const_pointer = typename AllocatorInterface<T>::const_pointer;
    using size_type = typename AllocatorInterface<T>::size_type;
    using difference_type = typename AllocatorInterface<T>::difference_type;

    ~SharedMemoryAllocatorInterface() = default;
    virtual pointer allocate(size_type n) = 0;
    virtual void deallocate(pointer p, size_type n) = 0;

protected: 
    void _log(T* p, size_type n, bool alloc = true) const 
    {
        std::cout << (alloc ? "Alloc: " : "Dealloc: ") << n
            << " bytes at " << std::hex << std::showbase
            << reinterpret_cast<void*>(p) << std::dec << std::endl;
    }
};

#endif // SHC_SHARED_MEMORY_ALLOCATOR_INTERFACE_HPP