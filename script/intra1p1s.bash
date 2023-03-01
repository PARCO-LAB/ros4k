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
ros2 run shc multit_sc_tcp intra1p1s 1 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra1p1s 1 1

# SC UDP
ros2 run shc multit_sc_udp intra1p1s 1 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra1p1s 1 1

# SHC
ros2 run shc multit_shc intra1p1s 1 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra1p1s 1 1

# ZC
ros2 run shc multit_zc intra1p1s 1 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra1p1s 1 1