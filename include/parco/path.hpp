/**
 * @file path.hpp
 * @author Mirco De Marchi (mirco@demarchi.dev)
 * @brief 
 * @version 0.1
 * @date 2021-11-15
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef INCLUDE_STD_FILESYSTEM_EXPERIMENTAL

// Test macro for <filesystem>.
#if defined(__cpp_lib_filesystem) 
#    define INCLUDE_STD_FILESYSTEM_EXPERIMENTAL 0

// Test macro for <experimental/filesystem>.
#elif defined(__cpp_lib_experimental_filesystem) || !defined(__has_include)
#    define INCLUDE_STD_FILESYSTEM_EXPERIMENTAL 1

// Check if the header <filesystem> exists.
#elif __has_include(<filesystem>)

#    ifdef _MSC_VER //< Check for Visual Studio. 
//       Check and include header that defines "_HAS_CXX17"
#        if __has_include(<yvals_core.h>)
#            include <yvals_core.h>
#            if defined(_HAS_CXX17) && _HAS_CXX17
#                define INCLUDE_STD_FILESYSTEM_EXPERIMENTAL 0
#            endif // #if defined(_HAS_CXX17) && _HAS_CXX17
#        endif // #if __has_include(<yvals_core.h>)

#        ifndef INCLUDE_STD_FILESYSTEM_EXPERIMENTAL
#            define INCLUDE_STD_FILESYSTEM_EXPERIMENTAL 1
#        endif // #ifndef INCLUDE_STD_FILESYSTEM_EXPERIMENTAL
#    else  // #ifdef _MSC_VER
#        define INCLUDE_STD_FILESYSTEM_EXPERIMENTAL 0
#    endif // #ifdef _MSC_VER

// Check if the header <experimental/filesystem> exists.
#elif __has_include(<experimental/filesystem>)
#    define INCLUDE_STD_FILESYSTEM_EXPERIMENTAL 1

#else
#    error Could not find header "<filesystem>" or "<experimental/filesystem>"
#endif // Tests and checks.

// Include.
#if INCLUDE_STD_FILESYSTEM_EXPERIMENTAL
#    include <experimental/filesystem>
namespace std {
    namespace filesystem = experimental::filesystem;
}
#else
#    include <filesystem>
#endif // #if INCLUDE_STD_FILESYSTEM_EXPERIMENTAL

#endif // INCLUDE_STD_FILESYSTEM_EXPERIMENTAL