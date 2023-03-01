/**
 * @file shc/shared_memory/interface.hpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-07-01
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef SHC_SHARED_MEMORY_POSIX_HPP
#define SHC_SHARED_MEMORY_POSIX_HPP

#include "interface.hpp"

#include <cstddef>

#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

class SharedMemoryPosix : public SharedMemoryInterface {
public:

    SharedMemoryPosix(SizeType size = 0, std::string name = std::string())
        : SharedMemoryInterface(
            shm_open(name.empty() ? "shared_memory_posix" : name.c_str(), 
                     O_CREAT | O_RDWR, 0666),
            size
        )
        , _name(name)
        , _ptr_to_size()
    { 
        resize(size);
    }

    ~SharedMemoryPosix() 
    {
        std::cout << "close descriptor: " << _descriptor << std::endl;
        close(_descriptor);
    }

    virtual PtrType map() override 
    {
        auto curr_size = size();
        auto void_ptr = mmap(
            NULL, curr_size, PROT_READ | PROT_WRITE, MAP_SHARED, _descriptor, 0);
        if (void_ptr == reinterpret_cast<void *>(-1))
        {
            throw std::runtime_error("map error: mmap failed");
        }
        auto p = static_cast<PtrType>(void_ptr);
        _ptr_to_size[p] = curr_size;
        std::cout << "posix map" << std::endl;
        return p;
    }

    virtual void unmap(PtrType p) override 
    {
        if (munmap(p, _ptr_to_size[p]) == -1)
        {
            throw std::runtime_error("unmap error: munmap failed");
        }
        std::cout << "posix munmap" << std::endl;
    }

    virtual void resize(SizeType s) override 
    {
        std::cout << "posix resize: " << s << " name: " << _name << std::endl;
        if (s == size()) return;
        SharedMemoryInterface::resize(s);
        if (ftruncate(_descriptor, size()) == -1)
        {
            throw std::runtime_error("resize error: ftruncate failed");
        }
    }

    std::string name() {return _name;}

private:
    std::string _name;
    std::map<PtrType, SizeType> _ptr_to_size;
};

#endif // SHC_SHARED_MEMORY_POSIX_HPP
