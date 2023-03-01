#!/bin/bash


source /opt/ros/eloquent/setup.bash
. /ros_ws/install/setup.bash

run_rmw_iceoryx() {

    /ros_ws/install/iceoryx_posh/bin/RouDi &
    pid_roudi=$!

    sleep 2

    eval $@

    sleep 2
    kill -9 $pid_roudi
    sleep 2
}

# SC TCP
ros2 run shc sc_tcp_sub inter1p1s_0 & ros2 run shc sc_tcp_pub inter1p1s_0 
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter1p1s_0 

# SC UDP
ros2 run shc sc_udp_sub inter1p1s_0 & ros2 run shc sc_udp_pub inter1p1s_0 
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter1p1s_0 

# SHC
ros2 run shc shc_sub inter1p1s_0 & ros2 run shc shc_pub inter1p1s_0 
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter1p1s_0

