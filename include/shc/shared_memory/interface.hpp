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

#ifndef SHC_SHARED_MEMORY_INTERFACE_HPP
#define SHC_SHARED_MEMORY_INTERFACE_HPP

#include <cstddef>
#include <map>


class SharedMemoryInterface {
public:
    using SizeType = std::size_t;
    using PtrType = void*;

    SharedMemoryInterface(int descriptor, SizeType s)
        : _descriptor(descriptor)
        , _size(s)
    { 
        std::cout << "open descriptor: " << _descriptor << std::endl;
        if (_descriptor == -1)
        {
            throw std::runtime_error("SharedMemoryInterface construct failed");
        }
    }

    ~SharedMemoryInterface() = default;

    virtual PtrType map() = 0;
    virtual void unmap(PtrType p) = 0;
    virtual void resize(SizeType s) { _size = s; }

    virtual PtrType malloc(SizeType s)
    {
        resize(s);
        return map();
    }

    virtual void free(PtrType p)
    {
        unmap(p);
    }

    SizeType size() { return _size; }

protected:
    int _descriptor;
    SizeType _size;
};

#endif // SHC_SHARED_MEMORY_INTERFACE_HPP
