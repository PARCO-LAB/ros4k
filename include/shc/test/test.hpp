/**
 * @file shc/test/test.hpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2022-07-01
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef SHC_TEST_TEST_HPP
#define SHC_TEST_TEST_HPP

#include <vector>
#include <cstddef>

const std::vector<std::size_t> SIZES_TO_TEST1(
    {
        1 << 4,
        1 << 16,
        1 << 19
    });

const std::vector<std::size_t> SIZES_TO_TEST2(
    {
        1 << 4,
        1 << 5,
        1 << 7,
        1 << 10,
        1 << 12,
        1 << 14,
        1 << 15,
        1 << 16,
        1 << 17,
        1 << 18,
        1 << 19,
        1 << 20,
    });

const std::vector<std::size_t> SIZES_TO_TEST = SIZES_TO_TEST2;

const std::size_t NUM_ITER = 30;

#endif // SHC_TEST_TEST_HPP
