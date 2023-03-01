/**
 * @file benchmark.hpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-07-04
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef SHC_BENCHMARK_BENCHMARK_HPP
#define SHC_BENCHMARK_BENCHMARK_HPP

#include <vector>

template<typename T>
void init(std::vector<T>& v, std::size_t length)
{
    v.resize(length);
    for (std::size_t i = 0; i < length; ++i)
    {
        v[i] = i;
    }
}

template<typename T>
bool check(const std::vector<T>& v)
{
    for (std::size_t i = 0; i < v.size(); ++i)
    {
        if (v[i] != i) return false;
    }
    return true;
}

#endif // SHC_BENCHMARK_BENCHMARK_HPP