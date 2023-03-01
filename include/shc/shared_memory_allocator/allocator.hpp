/**
 * @file shc/shared_memory_allocator/allocator.hpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2021-10-20
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef SHC_SHARED_MEMORY_ALLOCATOR_ALLOCATOR_HPP
#define SHC_SHARED_MEMORY_ALLOCATOR_ALLOCATOR_HPP

#include "interface.hpp"
#include "shc/shared_memory/posix.hpp"

#include <cstddef>
#include <memory>


template<typename SHM, typename T, std::size_t MAX_SIZE, std::size_t ID = 0>
class FixedSharedMemoryAllocator : public SharedMemoryAllocatorInterface<T>
{
public:
    using pointer = typename SharedMemoryAllocatorInterface<T>::pointer;
    using size_type = typename SharedMemoryAllocatorInterface<T>::size_type;

    FixedSharedMemoryAllocator() 
        : _size(0)
        , _shared_memory(
            MAX_SIZE, 
            "fixed_shared_memory_allocator" + std::to_string(ID))
        , _shm_ptr(_shared_memory.map())
    { }

    ~FixedSharedMemoryAllocator() noexcept 
    {
        _shared_memory.unmap(_shm_ptr);
    }

    template<typename U>
    FixedSharedMemoryAllocator(const FixedSharedMemoryAllocator<SHM, U, MAX_SIZE, ID>&) 
        : FixedSharedMemoryAllocator() 
    {}

    template<typename U>
    struct rebind
    {
        using other = FixedSharedMemoryAllocator<SHM, U, MAX_SIZE, ID>;
    };

    pointer allocate(size_type n)
    {
        if ((_size + sizeof(T) * n) > MAX_SIZE)
            throw std::bad_array_new_length();

        auto p = reinterpret_cast<char*>(_shm_ptr);
        auto p_ret = reinterpret_cast<T*>(p);
        _size += sizeof(T) * n;

        return p_ret;
    }

    void deallocate(pointer p, size_type n)
    {
        _size -= sizeof(T) * n;
    }

    template<typename U>
    constexpr bool operator==(const FixedSharedMemoryAllocator<SHM, U, MAX_SIZE> &) noexcept
    {
        return true;
    }

    template<typename U>
    constexpr bool operator!=(const FixedSharedMemoryAllocator<SHM, U, MAX_SIZE> &) noexcept
    {
        return false;
    }

private:
    std::size_t _size;
    SHM _shared_memory;
    void* _shm_ptr;
};

template<typename T, std::size_t MAX_SIZE, std::size_t ID = 0>
using FixedSharedMemoryPosixAllocator = FixedSharedMemoryAllocator<SharedMemoryPosix, T, MAX_SIZE, ID>;

template <typename SHM, typename T, std::size_t ID = 0>
class SharedMemoryAllocator : public SharedMemoryAllocatorInterface<T>
{
public:
    using pointer = typename SharedMemoryAllocatorInterface<T>::pointer;
    using size_type = typename SharedMemoryAllocatorInterface<T>::size_type;

    SharedMemoryAllocator(std::string shm_name = std::string())
        : _name(shm_name.empty() ? "shared_memory_allocator" + std::to_string(ID) : shm_name)
        , _shared_memory(std::make_shared<SHM>(0, _name))
    { 
        std::cout << "shm name: " << _name << std::endl;
    }

    ~SharedMemoryAllocator() noexcept
    { }

    template<typename U>
    SharedMemoryAllocator(const SharedMemoryAllocator<SHM, U, ID>& obj) 
        : _name(obj._name)
        , _shared_memory(obj._shared_memory)
    { 
        std::cout << "shm name copy: " << _name << std::endl;
    }

    template<typename U>
    struct rebind
    {
        using other = SharedMemoryAllocator<SHM, U, ID>;
    };

    pointer allocate(size_type n)
    {   
        auto ret = static_cast<pointer>(_shared_memory->malloc(n * sizeof(T)));
        SharedMemoryAllocatorInterface<T>::_log(ret, n * sizeof(T), true);
        return ret;
    }

    void deallocate(pointer p, size_type n)
    {
        SharedMemoryAllocatorInterface<T>::_log(p, n * sizeof(T), false);
        return _shared_memory->free(p);
    }

    template<typename U>
    constexpr bool operator==(const SharedMemoryAllocator<SHM, U> &) noexcept
    {
        return true;
    }

    template<typename U>
    constexpr bool operator!=(const SharedMemoryAllocator<SHM, U> &) noexcept
    {
        return false;
    }

    const std::string& name() const { return _name; }

    std::string _name;
    std::shared_ptr<SHM> _shared_memory;
};

template <typename T>
using SharedMemoryPosixAllocator = SharedMemoryAllocator<SharedMemoryPosix, T, 0>;


template <typename SHM, typename T, std::size_t ID = 0>
class MultiSharedMemoryAllocator : public SharedMemoryAllocatorInterface<T>
{
public:
    using pointer = typename SharedMemoryAllocatorInterface<T>::pointer;
    using size_type = typename SharedMemoryAllocatorInterface<T>::size_type;

    MultiSharedMemoryAllocator(std::string name = std::string()) noexcept
        : _name(name.empty() ? "multi_shared_memory_allocator" + std::to_string(ID) : name)
        , _ptr_to_name()
        , _shared_memory_map()
    {

    }

    MultiSharedMemoryAllocator() noexcept
    { }

    template<typename U>
    MultiSharedMemoryAllocator(const MultiSharedMemoryAllocator<SHM, U>& obj) noexcept 
        : _name(obj._name)
        , _ptr_to_name(obj._ptr_to_name)
        , _shared_memory_map(obj._shared_memory_map)
    { }

    template<typename U>
    struct rebind
    {
        using other = MultiSharedMemoryAllocator<SHM, U>;
    };

    pointer allocate(size_type n)
    {
        if (_shared_memory_map.count(_name) == 0)
        {
            auto shm = SHM(n, _name);
            _shared_memory_map[_name] = shm;
            auto ret = static_cast<pointer>(shm.malloc(n * sizeof(T)));
            _ptr_to_name[ret] = _name;
            return ret;
        }
        else 
        {
            auto shm = _shared_memory_map[_name];
            shm.resize(n * sizeof(T));
            auto ret = static_cast<pointer>(shm.map());
            _ptr_to_name[ret] = _name;
            return ret;
        }
    }

    void deallocate(pointer p, size_type n)
    {
        auto shm = _shared_memory_map[_ptr_to_name[p]];
        shm.free(p);
    }

    void set_name(std::string name) { _name = name; }
    const std::string& get_name() const { return _name; }

    template<typename U>
    constexpr bool operator==(const MultiSharedMemoryAllocator<SHM, U> &) noexcept
    {
        return true;
    }

    template<typename U>
    constexpr bool operator!=(const MultiSharedMemoryAllocator<SHM, U> &) noexcept
    {
        return false;
    }

private:
    std::string _name;
    std::map<pointer, std::string> _ptr_to_name;
    std::map<std::string, SHM> _shared_memory_map;
};

template <typename T, std::size_t ID = 0>
using MultiSharedMemoryPosixAllocator = MultiSharedMemoryAllocator<SharedMemoryPosix, T, ID>;

#endif // SHC_SHARED_MEMORY_ALLOCATOR_ALLOCATOR_HPP