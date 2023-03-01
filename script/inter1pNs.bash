#!/bin/bash

source /opt/ros/eloquent/setup.bash
. ~/Repositories/ros2_ws/install/setup.bash

run_rmw_iceoryx() {

    ~/Repositories/ros2_ws/install/iceoryx_posh/bin/RouDi &
    pid_roudi=$!

    sleep 2

    eval $@

    sleep 2
    kill -9 $pid_roudi
    sleep 2
}

# SC TCP
ros2 run shc sc_tcp_sub inter1p2s_0 & ros2 run shc sc_tcp_sub inter1p2s_1 & ros2 run shc sc_tcp_pub inter1p2s_0
ros2 run shc sc_tcp_sub inter1p3s_0 & ros2 run shc sc_tcp_sub inter1p3s_1 & ros2 run shc sc_tcp_sub inter1p3s_2 & ros2 run shc sc_tcp_pub inter1p3s_0
ros2 run shc sc_tcp_sub inter1p4s_0 & ros2 run shc sc_tcp_sub inter1p4s_1 & ros2 run shc sc_tcp_sub inter1p4s_2 & ros2 run shc sc_tcp_sub inter1p4s_3 & ros2 run shc sc_tcp_pub inter1p4s_0
ros2 run shc sc_tcp_sub inter1p5s_0 & ros2 run shc sc_tcp_sub inter1p5s_1 & ros2 run shc sc_tcp_sub inter1p5s_2 & ros2 run shc sc_tcp_sub inter1p5s_3 & ros2 run shc sc_tcp_sub inter1p5s_4 & ros2 run shc sc_tcp_pub inter1p5s_0

run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p2s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p2s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter1p2s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p3s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p3s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p3s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter1p3s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p4s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p4s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p4s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p4s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter1p4s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p5s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p5s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p5s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p5s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter1p5s_4 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter1p5s_0


# SC UDP
ros2 run shc sc_udp_sub inter1p2s_0 & ros2 run shc sc_udp_sub inter1p2s_1 & ros2 run shc sc_udp_pub inter1p2s_0
ros2 run shc sc_udp_sub inter1p3s_0 & ros2 run shc sc_udp_sub inter1p3s_1 & ros2 run shc sc_udp_sub inter1p3s_2 & ros2 run shc sc_udp_pub inter1p3s_0
ros2 run shc sc_udp_sub inter1p4s_0 & ros2 run shc sc_udp_sub inter1p4s_1 & ros2 run shc sc_udp_sub inter1p4s_2 & ros2 run shc sc_udp_sub inter1p4s_3 & ros2 run shc sc_udp_pub inter1p4s_0
ros2 run shc sc_udp_sub inter1p5s_0 & ros2 run shc sc_udp_sub inter1p5s_1 & ros2 run shc sc_udp_sub inter1p5s_2 & ros2 run shc sc_udp_sub inter1p5s_3 & ros2 run shc sc_udp_sub inter1p5s_4 & ros2 run shc sc_udp_pub inter1p5s_0

run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p2s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p2s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter1p2s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p3s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p3s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p3s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter1p3s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p4s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p4s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p4s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p4s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter1p4s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p5s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p5s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p5s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p5s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter1p5s_4 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter1p5s_0


# SHC
ros2 run shc shc_sub inter1p2s_0 & ros2 run shc shc_sub inter1p2s_1 & ros2 run shc shc_pub inter1p2s_0
ros2 run shc shc_sub inter1p3s_0 & ros2 run shc shc_sub inter1p3s_1 & ros2 run shc shc_sub inter1p3s_2 & ros2 run shc shc_pub inter1p3s_0
ros2 run shc shc_sub inter1p4s_0 & ros2 run shc shc_sub inter1p4s_1 & ros2 run shc shc_sub inter1p4s_2 & ros2 run shc shc_sub inter1p4s_3 & ros2 run shc shc_pub inter1p4s_0
ros2 run shc shc_sub inter1p5s_0 & ros2 run shc shc_sub inter1p5s_1 & ros2 run shc shc_sub inter1p5s_2 & ros2 run shc shc_sub inter1p5s_3 & ros2 run shc shc_sub inter1p5s_4 & ros2 run shc shc_pub inter1p5s_0

run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p2s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p2s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter1p2s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p3s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p3s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p3s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter1p3s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p4s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p4s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p4s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p4s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter1p4s_0
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p5s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p5s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p5s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p5s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter1p5s_4 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter1p5s_0

