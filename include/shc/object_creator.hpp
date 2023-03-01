/**
 * @file shc/shared_memory/object_creator.hpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-07-01
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef SHC_SHARED_MEMORY_OBJECT_CREATOR_HPP
#define SHC_SHARED_MEMORY_OBJECT_CREATOR_HPP

#include "shc/shared_memory_allocator/interface.hpp"


template<typename T, template<typename> class SharedMemoryAllocator>
class SharedMemoryObjectCreator
{
public: 
    using PtrType = T*;
    using SizeType = std::size_t;

    SharedMemoryObjectCreator(std::string shm_name = std::string())
        : _shm_name(shm_name)
        , _shared_memory_allocator(shm_name)
    { }

    template<typename U>
    PtrType instance(const SharedMemoryAllocator<U>& alloc)
    {
        auto ptr = _shared_memory_allocator.allocate(sizeof(T));
        return new (ptr) T(alloc);
    }

    PtrType reserve()
    {
        auto ptr = _shared_memory_allocator.allocate(sizeof(T));
        return reinterpret_cast<PtrType>(ptr);
    }

    void free(PtrType ptr)
    {
        ptr->~T();
        _shared_memory_allocator.deallocate(reinterpret_cast<typename SharedMemoryAllocator<char>::pointer>(ptr), 0);
    }

private:
    std::string _shm_name;
    SharedMemoryAllocator<void> _shared_memory_allocator;
};



#endif // SHC_SHARED_MEMORY_OBJECT_CREATOR_HPP
