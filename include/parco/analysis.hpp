/**
 * @file analysis.hpp
 * @author Mirco De Marchi (mirco@demarchi.dev)
 * @brief 
 * @version 0.1
 * @date 2021-11-15
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef ANALYSIS_HPP
#define ANALYSIS_HPP

#include <cmath>
#include <algorithm>
#include <numeric>
#include <vector>
#include <cstddef>
#include <iostream>
#include <string>
#include <fstream>
#include <map>
#include <chrono>
#include <sstream>

#include "path.hpp"


namespace parco {

namespace analysis {

namespace fs = std::filesystem;
#define DEBUG 1

#if DEBUG

class Time {
public:
    Time() 
        : _start()
        , _end()
    {

    }

    ~Time() {}

    void start() 
    {
        _start = std::chrono::high_resolution_clock::now().time_since_epoch();
    }

    void stop() 
    {
        _end = std::chrono::high_resolution_clock::now().time_since_epoch();
    }

    template<typename P = std::milli>
    double elapsed()
    {
        std::chrono::duration<double, P> elapsed = _end - _start;
        return elapsed.count();
    }

    void print(std::string s)
    {
        std::cout << s << elapsed() << " ms"; 
    }

private:
    std::chrono::nanoseconds _start;
    std::chrono::nanoseconds _end;
};

template<typename T = double, typename P = std::milli>
class TimeVector {
public: 
    TimeVector()
        : _t()
        , _v()
    {

    }

    ~TimeVector()
    {

    }

    void start() 
    {
        _t.start();
    }

    void stop() 
    {
        _t.stop();
        _v.push_back(_t.elapsed<P>());
    }

    double elapsed()
    {
        if (_v.empty()) return -1.0;
        return _v[_v.size() - 1];
    }

    std::vector<T>& values() { return _v; }

    operator std::vector<T>()
    {
        return _v;
    }

private:
    Time _t;
    std::vector<T> _v;
};

template<typename T>
class Vector {
public:
    Vector(std::vector<T>& v, std::string s = "")
        : _v{v}
        , _s{s}
    {
    }

    Vector(const Vector& obj)
        : _v{obj._v}
        , _s{obj._s}
    {

    }

    Vector& operator=(Vector obj)
    {
        _v = obj._v;
        _s = obj._s;
        return *this;
    }

    T median(std::size_t skip_first_n = 0) const
    {
        if(skip_first_n >= _v.size()) 
            throw std::runtime_error("shape overload");
        std::size_t mid = (_v.size() - skip_first_n - 1) / 2;
        std::nth_element(
            _v.begin() + skip_first_n, 
            _v.begin() + skip_first_n + mid, 
            _v.end());
        return _v[mid];
    }

    template <typename R = T>
    R mean(std::size_t skip_first_n = 0) const
    {
        if(skip_first_n >= _v.size()) 
            throw std::runtime_error("shape overload");
        return std::accumulate(
            _v.begin() + skip_first_n, 
            _v.end(), 0.0) / (_v.size() - skip_first_n);
    }

    template <typename R = T>
    R std(std::size_t skip_first_n = 0) const
    {
        if(skip_first_n >= _v.size()) 
            throw std::runtime_error("shape overload");
        R m = mean<R>();
        std::vector<R> diff(_v.size() - skip_first_n);
        std::transform(
            _v.begin() + skip_first_n, _v.end(), 
            diff.begin(), 
            [m](T x) { 
                return x - m; 
            });
        R sqsum = std::inner_product(
            diff.begin(), diff.end(), diff.begin(), 0.0);
        R std = std::sqrt(
            sqsum / diff.size());
        return std;
    }

    void show_values(std::size_t skip_first_n = 0) const
    {
        std::cout << _s << ",[";
        if (empty() || skip_first_n >= _v.size()) 
        {
            std::cout << "]" << std::endl;
            return;
        }
        for (std::size_t i = skip_first_n; i < (_v.size() - 1); ++i)
        {
            std::cout << _v[i] << ", ";
        }
        std::cout << _v[_v.size() - 1] << "]" << std::endl;
    }

    friend std::ostream& operator<<(std::ostream& stream, const Vector& v) 
    { 
        if (empty()) return stream;
        for (std::size_t i = 0; i < (v.size() - 1); ++i)
        {
            stream << v[i] << ", ";
        }
        stream << v[v.size() - 1] << std::endl;
        return stream; 
    }

    void dump_values(fs::path path = ".", 
        std::size_t skip_first_n = 0, std::string header = "data")
    {
        if (fs::exists(path))
        {
            if (!fs::is_directory(path))
            {
                throw std::runtime_error("path is not a directory");
            }
        }
        else 
        {
            fs::create_directories(path);
        }

        std::ofstream f;
        fs::path join_path{path};
        join_path /= _s.empty() ? "values.csv" : _s + "_values.csv";

        if (!fs::exists(join_path))
        {
            f.open(join_path);
            f << header << std::endl;
            f.close();
        }

        f.open(join_path, std::ofstream::out | std::ofstream::app);
        if(!f.is_open() || !f.good()) 
        {
            throw std::runtime_error("dump file open error");
        }
        for (std::size_t i = skip_first_n; i < _v.size(); ++i)
        {
            f<< _v[i] << std::endl;
        }
        clear();
        f.close();
    }

    void load_values(fs::path fp = ".", std::size_t skip_first_n = 0)
    {
        if (fs::exists(fp))
        {
            if (!fs::is_directory(fp))
            {
                throw std::runtime_error("load path is not a directory");
            }
        }
        else 
        {
            throw std::runtime_error("load path is not exist");
        }

        std::ifstream f;
        fs::path join_path{fp};
        join_path /= _s.empty() ? "values.csv" : _s + "_values.csv";
        f.open(join_path);
        if(!f.is_open() || !f.good()) 
        {
            throw std::runtime_error("load file open error");
        }

        // Skip header. 
        f.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        // Skip lines.
        for (std::size_t i = 0; i < skip_first_n; ++i)
        {
            f.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        }
        
        std::string line;
        while(std::getline(f, line))
        {
            T val;
            std::stringstream ss{line};
            ss >> val;
            if (!ss.fail() && ss.eof())
            {
                _v.push_back(val);
            }
        }
        f.close();
    }

    template <typename R = T>
    void show_analysis(std::size_t skip_first_n = 0) const
    {  
        std::string title = "======= SHOW " + _s + " ANALYSIS =======";
        std::cout << title << std::endl; 
        std::cout << "mean: " << mean<R>(skip_first_n) << std::endl;
        std::cout << "std: " << std<R>(skip_first_n) << std::endl;
        std::cout << "median: " << median(skip_first_n) << std::endl;
        std::cout << std::string(title.size(), '=') << std::endl;
    }

    template <typename R = T>
    void dump_analysis(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        if (fs::exists(path))
        {
            if (!fs::is_directory(path))
            {
                throw std::runtime_error("path is not a directory");
            }
        }
        else 
        {
            fs::create_directories(path);
        }

        dump_values(path);
        load_values(path);

        std::ofstream f;
        fs::path join_path{path};
        join_path /= _s.empty() ? "analysis.csv" : _s + "_analysis.csv";

        f.open(join_path);
        if(!f.is_open() || !f.good()) 
        {
            throw std::runtime_error("dump analysis file open error");
        }
        f << "metric,value" << std::endl;
        
        f << "mean," << mean<R>(skip_first_n) << std::endl;
        f << "std," << std<R>(skip_first_n) << std::endl;
        f << "median," << median(skip_first_n) << std::endl;
        f.close();
        clear();
    }

    template <typename R = T>
    void dump(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        dump_values(path, skip_first_n);
        dump_analysis<R>(path);
    }

    bool empty() const
    {
        return _v.empty();
    }

    void clear()
    {
        _v.clear();
    }

    std::string& name() { return _s; }
    const std::string& name() const { return _s; }

    const std::vector<T>& values() const { return _v; }

private:
    std::vector<T>& _v;
    std::string _s;
};

/**
 * @brief Matrix Analysis.
 * @tparam T 
 */
template<typename T>
class Matrix {
public:
    Matrix()
        : _m{}
        , _s{}
    {

    }

    Matrix(std::vector<Vector<T>> v = {}, std::string s = "")
        : _m{v}
        , _s{s}
    {

    }

    Matrix(std::map<std::string, std::vector<T>&> m = {}, std::string s = "")
        : _m{}
        , _s{s}
    {
        for (const auto& e: m)
        {
            _m.push_back(Vector<T>(e.second, e.first));
        }
    }

    Matrix(const Matrix& obj)
        : _m{obj.v}
        , _s{obj.s}
    {

    }

    void show_values(std::size_t skip_first_n = 0) const
    {
        if (empty()) return;
        for (const auto& v: _m)
        {
            v.show_values(skip_first_n);
        }
    }

    void dump_values(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        fs::path join_path{path};
        join_path /= _s.empty() ? "values" : _s + "_values";
        for (auto& v: _m)
        {
            v.dump_values(join_path, skip_first_n);
        }
    }

    template <typename R = T>
    void show_analysis(std::size_t skip_first_n = 0) const
    {  
        std::string title = "======= SHOW " + _s + " ANALYSIS =======";
        std::cout << title << std::endl; 
        std::cout << "id,mean,std,median" << std::endl;
        for (const auto& v: _m)
        {
            std::cout << v.name() 
                << "," << v.template mean<R>(skip_first_n)
                << "," << v.template std<R>(skip_first_n) 
                << "," << v.median(skip_first_n) 
                << std::endl;
        }
        std::cout << std::string(title.size(), '=') << std::endl;
    }

    template <typename R = T>
    void dump_analysis(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        if (fs::exists(path))
        {
            if (!fs::is_directory(path))
            {
                throw std::runtime_error("path is not a directory");
            }
        }
        else 
        {
            fs::create_directories(path);
        }

        std::ofstream f;
        fs::path join_path{path};
        join_path /= _s.empty() ? "analysis.csv" : _s + "_analysis.csv";
        fs::path values_path{path};
        values_path /= _s.empty() ? "values" : _s + "_values";

        f.open(join_path);
        if(!f.is_open() || !f.good()) 
        {
            throw std::runtime_error("dump analysis file open error");
        }
        f << "id,mean,std,median" << std::endl;
        for (auto& v: _m)
        {
            v.dump_values(values_path);
            v.load_values(values_path);
            if (v.empty() || v.values().size() < skip_first_n)
            {
                v.clear();
                continue;
            }
            f << v.name()
              << "," << v.template mean<R>(skip_first_n)
              << "," << v.template std<R>(skip_first_n) 
              << "," << v.median(skip_first_n) 
              << std::endl;
            v.clear();
        }
        f.close();
    }

    template <typename R = T>
    void dump(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        dump_values(path, skip_first_n);
        dump_analysis<R>(path);
    }

    bool empty() const
    {
        return _m.empty();
    }

private:
    std::vector<Vector<T>> _m;
    std::string _s;
};

#else 

class Time {
public:
    Time() { }

    ~Time() {}

    void start() { }

    void stop() { }

    template<typename P = std::milli>
    double elapsed()
    {
        return 0.0;
    }

    void print(std::string s)
    {
        (void) s;
    }
};

template<typename T = double, typename P = std::milli>
class TimeVector {
public: 
    TimeVector() { }

    ~TimeVector() { }

    void start() 
    {
    }

    void stop() 
    {
    }

    double elapsed()
    {
        return 0.0;
    }

    std::vector<T>& values() { return _v; }

    operator std::vector<T>() { return std::vector<T>(); }

private:
    std::vector<T> _v;
};

template<typename T>
class Vector {
public:
    Vector(std::vector<T>& v, std::string s = "")
        : _v{v}
    {
        (void) s;
    }

    Vector(const Vector& obj)
        : _v{obj._v}
    {
        
    }

    Vector& operator=(Vector obj)
    {
        _v = obj._v;
        return *this;
    }

    T median(std::size_t skip_first_n = 0) const
    {
        (void) skip_first_n;
        return T();
    }

    template <typename R = T>
    R mean(std::size_t skip_first_n = 0) const
    {
        (void) skip_first_n;
        return R();
    }

    template <typename R = T>
    R std(std::size_t skip_first_n = 0) const
    {
        (void) skip_first_n;
        return R();
    }

    void show_values(std::size_t skip_first_n = 0) const
    {
        (void) skip_first_n;
    }

    friend std::ostream& operator<<(std::ostream& stream, const Vector& v) 
    { 
        (void) stream;
        (void) v;
        return stream; 
    }

    void dump_values(fs::path path = ".", 
        std::size_t skip_first_n = 0, std::string header = "data")
    {
        (void) path;
        (void) skip_first_n;
        (void) header;
    }

    void load_values(fs::path fp = ".", std::size_t skip_first_n = 0)
    {
        (void) fp;
        (void) skip_first_n;
    }

    template <typename R = T>
    void show_analysis(std::size_t skip_first_n = 0) const
    {  
        (void) skip_first_n;
    }

    template <typename R = T>
    void dump_analysis(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        (void) path;
        (void) skip_first_n;
    }

    template <typename R = T>
    void dump(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        (void) path;
        (void) skip_first_n;
    }

    bool empty() const { return true; }

    void clear() { }

    std::string& name() { return _s; }
    const std::string& name() const { return _s; }

    const std::vector<T>& values() const { return _v; }

private:
    std::vector<T>& _v;
    std::string _s;
};

/**
 * @brief Matrix Analysis.
 * @tparam T 
 */
template<typename T>
class Matrix {
public:
    Matrix()
    {

    }

    Matrix(std::vector<Vector<T>> v = {}, std::string s = "")
    {
        (void) v;
        (void) s;
    }

    Matrix(std::map<std::string, std::vector<T>&> m = {}, std::string s = "")
    {
        (void) m;
        (void) s;
    }

    Matrix(const Matrix& obj)
    {
        (void) obj;
    }

    void show_values(std::size_t skip_first_n = 0) const
    {
        (void) skip_first_n;
    }

    void dump_values(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        (void) path;
        (void) skip_first_n;
    }

    template <typename R = T>
    void show_analysis(std::size_t skip_first_n = 0) const
    {  
        (void) skip_first_n;
    }

    template <typename R = T>
    void dump_analysis(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        (void) path;
        (void) skip_first_n;
    }

    template <typename R = T>
    void dump(fs::path path = ".", std::size_t skip_first_n = 0)
    {
        (void) path;
        (void) skip_first_n;
    }

    bool empty() const { return true; }
};
#endif

} // namespace analysis

} // namespace parco

#endif // ANALYSIS_HPP