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
ros2 run shc sc_tcp_sub inter2p1s_0 & ros2 run shc sc_tcp_pub inter2p1s_0 & ros2 run shc sc_tcp_pub inter2p1s_1
ros2 run shc sc_tcp_sub inter3p1s_0 & ros2 run shc sc_tcp_pub inter3p1s_0 & ros2 run shc sc_tcp_pub inter3p1s_1 & ros2 run shc sc_tcp_pub inter3p1s_2
ros2 run shc sc_tcp_sub inter4p1s_0 & ros2 run shc sc_tcp_pub inter4p1s_0 & ros2 run shc sc_tcp_pub inter4p1s_1 & ros2 run shc sc_tcp_pub inter4p1s_2 & ros2 run shc sc_tcp_pub inter4p1s_3
ros2 run shc sc_tcp_sub inter5p1s_0 & ros2 run shc sc_tcp_pub inter5p1s_0 & ros2 run shc sc_tcp_pub inter5p1s_1 & ros2 run shc sc_tcp_pub inter5p1s_2 & ros2 run shc sc_tcp_pub inter5p1s_3 & ros2 run shc sc_tcp_pub inter5p1s_4

run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter2p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter2p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter2p1s_1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter3p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter3p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter3p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter3p1s_2
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter4p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter4p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter4p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter4p1s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter4p1s_3
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_sub iceoryx_inter5p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter5p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter5p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter5p1s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter5p1s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_tcp_pub iceoryx_inter5p1s_4


# SC UDP
ros2 run shc sc_udp_sub inter2p1s_0 & ros2 run shc sc_udp_pub inter2p1s_0 & ros2 run shc sc_udp_pub inter2p1s_1
ros2 run shc sc_udp_sub inter3p1s_0 & ros2 run shc sc_udp_pub inter3p1s_0 & ros2 run shc sc_udp_pub inter3p1s_1 & ros2 run shc sc_udp_pub inter3p1s_2
ros2 run shc sc_udp_sub inter4p1s_0 & ros2 run shc sc_udp_pub inter4p1s_0 & ros2 run shc sc_udp_pub inter4p1s_1 & ros2 run shc sc_udp_pub inter4p1s_2 & ros2 run shc sc_udp_pub inter4p1s_3
ros2 run shc sc_udp_sub inter5p1s_0 & ros2 run shc sc_udp_pub inter5p1s_0 & ros2 run shc sc_udp_pub inter5p1s_1 & ros2 run shc sc_udp_pub inter5p1s_2 & ros2 run shc sc_udp_pub inter5p1s_3 & ros2 run shc sc_udp_pub inter5p1s_4

run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter2p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter2p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter2p1s_1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter3p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter3p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter3p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter3p1s_2
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter4p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter4p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter4p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter4p1s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter4p1s_3
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_sub iceoryx_inter5p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter5p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter5p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter5p1s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter5p1s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc sc_udp_pub iceoryx_inter5p1s_4


# SHC
ros2 run shc shc_sub inter2p1s_0 & ros2 run shc shc_pub inter2p1s_0 & ros2 run shc shc_pub inter2p1s_1
ros2 run shc shc_sub inter3p1s_0 & ros2 run shc shc_pub inter3p1s_0 & ros2 run shc shc_pub inter3p1s_1 & ros2 run shc shc_pub inter3p1s_2
ros2 run shc shc_sub inter4p1s_0 & ros2 run shc shc_pub inter4p1s_0 & ros2 run shc shc_pub inter4p1s_1 & ros2 run shc shc_pub inter4p1s_2 & ros2 run shc shc_pub inter4p1s_3
ros2 run shc shc_sub inter5p1s_0 & ros2 run shc shc_pub inter5p1s_0 & ros2 run shc shc_pub inter5p1s_1 & ros2 run shc shc_pub inter5p1s_2 & ros2 run shc shc_pub inter5p1s_3 & ros2 run shc shc_pub inter5p1s_4

run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter2p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter2p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter2p1s_1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter3p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter3p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter3p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter3p1s_2
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter4p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter4p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter4p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter4p1s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter4p1s_3
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_sub iceoryx_inter5p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter5p1s_0 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter5p1s_1 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter5p1s_2 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter5p1s_3 & RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc shc_pub iceoryx_inter5p1s_4

