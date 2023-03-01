cmake_minimum_required(VERSION 3.5)

# ------------------------------------------------------------------------------
# Setup project.
project(shc LANGUAGES CXX C)
set(ROS_DEPENDENCIES "")

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()


# ------------------------------------------------------------------------------
# Set the C++ compiler options.
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O1")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fomit-frame-pointer")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-builtin")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-stack-protector")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=i686")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpedantic")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic-errors")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wextra")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wconversion")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcast-align")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcast-qual")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wdisabled-optimization")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wfloat-equal")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wfloat-conversion")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat=2")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat-nonliteral")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat-security")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat-y2k")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wimport")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Winit-self")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Winline")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Winvalid-pch")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-long-long")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-field-initializers")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-format-attribute")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-include-dirs")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpacked")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpointer-arith")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wredundant-decls")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstack-protector")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstrict-aliasing=2")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch-default")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch-enum")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunreachable-code")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-function")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-label")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-parameter")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-value")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-variable")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wvariadic-macros")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wwrite-strings")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsign-compare")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsign-conversion")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wuninitialized")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fmessage-length=0")


# ------------------------------------------------------------------------------
# Find dependencies.
find_package(ZED 3 REQUIRED)
find_package(CUDA REQUIRED)

find_package(ament_cmake REQUIRED)
# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

find_package(rclcpp REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
# find_package(sensor_msgs REQUIRED)
# find_package(parco_cv_bridge REQUIRED)

set(ROS_DEPENDENCIES ${ROS_DEPENDENCIES} rclcpp)
set(ROS_DEPENDENCIES ${ROS_DEPENDENCIES} std_msgs)
set(ROS_DEPENDENCIES ${ROS_DEPENDENCIES} sensor_msgs)

link_directories(${ZED_LIBRARY_DIR})
link_directories(${CUDA_LIBRARY_DIRS})

set(ZED_LIBS
  ${ZED_LIBRARIES}
  ${CUDA_LIBRARIES}
)


# ------------------------------------------------------------------------------
# Add interfaces.

set(MSG_FILES
  msg/Header.msg
  msg/Token.msg
  msg/Data.msg
)

# set(SRV_FILES
# )

rosidl_generate_interfaces(${PROJECT_NAME} 
  ${MSG_FILES}
  # ${SRV_FILES}
  DEPENDENCIES std_msgs sensor_msgs
)
ament_export_dependencies(rosidl_default_runtime)

# ------------------------------------------------------------------------------
# Add the includes.
include_directories(
  ${CUDA_INCLUDE_DIRS}
  ${ZED_INCLUDE_DIRS}
  include
)

# ------------------------------------------------------------------------------
# Node executables.

set(BENCHMARK_INTER_NODES
  # sc_tcp_pub
  # sc_tcp_sub
  # sc_udp_pub
  # sc_udp_sub
  # shc_pub
  # shc_sub
  # iceoryx_pub
  # iceoryx_sub
)

set(BENCHMARK_INTRA_NODES
  # multit_zc
  # multit_sc_tcp
  # multit_sc_udp
  # multit_shc
  # multit_iceoryx
)

set(KAIROS_NODES
  sc_zed
)

foreach(NODE ${BENCHMARK_INTER_NODES})
  add_executable(${NODE} src/benchmark/inter/${NODE}.cpp)

  ament_target_dependencies(${NODE} 
    ${ROS_DEPENDENCIES}
  )
  target_link_libraries(${NODE} stdc++fs rt)
  rosidl_target_interfaces(${NODE}
    ${PROJECT_NAME} "rosidl_typesupport_cpp")
endforeach()

foreach(NODE ${BENCHMARK_INTRA_NODES})
  add_executable(${NODE} src/benchmark/intra/${NODE}.cpp)

  ament_target_dependencies(${NODE} 
    ${ROS_DEPENDENCIES}
  )
  target_link_libraries(${NODE} stdc++fs rt)
  rosidl_target_interfaces(${NODE}
    ${PROJECT_NAME} "rosidl_typesupport_cpp")
endforeach()

foreach(NODE ${KAIROS_NODES})
  add_executable(${NODE} src/kairos/${NODE}.cpp)

  ament_target_dependencies(${NODE} 
    ${ROS_DEPENDENCIES}
  )
  target_link_libraries(${NODE} stdc++fs rt ${ZED_LIBS})
  rosidl_target_interfaces(${NODE}
    ${PROJECT_NAME} "rosidl_typesupport_cpp")
endforeach()


# ------------------------------------------------------------------------------
# Install directives.

install(TARGETS
  ${BENCHMARK_INTER_NODES}
  ${BENCHMARK_INTRA_NODES}
  DESTINATION lib/${PROJECT_NAME}
)

install(
  DIRECTORY include/
  DESTINATION include
)

# Install launch files.
# install(DIRECTORY
#   launch
#   DESTINATION share/${PROJECT_NAME}/
# )

# ------------------------------------------------------------------------------
# Testing directives.

set(TESTS
  test_vector
  test_object_creator
)

foreach(TEST ${TESTS})
  add_executable(${TEST} test/${TEST}.cpp)
  target_link_libraries(${TEST} stdc++fs rt)
endforeach()

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
