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
ros2 run shc multit_sc_tcp intra1p2s 1 2
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra1p2s 1 2
ros2 run shc multit_sc_tcp intra1p3s 1 3
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra1p3s 1 3
ros2 run shc multit_sc_tcp intra1p4s 1 4
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra1p4s 1 4
ros2 run shc multit_sc_tcp intra1p5s 1 5
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra1p5s 1 5


# SC UDP
ros2 run shc multit_sc_udp intra1p2s 1 2
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra1p2s 1 2
ros2 run shc multit_sc_udp intra1p3s 1 3
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra1p3s 1 3
ros2 run shc multit_sc_udp intra1p4s 1 4
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra1p4s 1 4
ros2 run shc multit_sc_udp intra1p5s 1 5
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra1p5s 1 5


# SHC
ros2 run shc multit_shc intra1p2s 1 2
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra1p2s 1 2
ros2 run shc multit_shc intra1p3s 1 3
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra1p3s 1 3
ros2 run shc multit_shc intra1p4s 1 4
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra1p4s 1 4
ros2 run shc multit_shc intra1p5s 1 5
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra1p5s 1 5


# ZC
ros2 run shc multit_zc intra1p2s 1 2
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra1p2s 1 2
ros2 run shc multit_zc intra1p3s 1 3
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra1p3s 1 3
ros2 run shc multit_zc intra1p4s 1 4
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra1p4s 1 4
ros2 run shc multit_zc intra1p5s 1 5
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra1p5s 1 5

