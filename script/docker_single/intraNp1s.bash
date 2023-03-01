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
ros2 run shc multit_sc_tcp intra2p1s 2 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra2p1s 2 1
ros2 run shc multit_sc_tcp intra3p1s 3 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra3p1s 3 1
ros2 run shc multit_sc_tcp intra4p1s 4 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra4p1s 4 1
ros2 run shc multit_sc_tcp intra5p1s 5 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_tcp iceoryx_intra5p1s 5 1


# SC UDP
ros2 run shc multit_sc_udp intra2p1s 2 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra2p1s 2 1
ros2 run shc multit_sc_udp intra3p1s 3 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra3p1s 3 1
ros2 run shc multit_sc_udp intra4p1s 4 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra4p1s 4 1
ros2 run shc multit_sc_udp intra5p1s 5 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_sc_udp iceoryx_intra5p1s 5 1


# SHC
ros2 run shc multit_shc intra2p1s 2 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra2p1s 2 1
ros2 run shc multit_shc intra3p1s 3 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra3p1s 3 1
ros2 run shc multit_shc intra4p1s 4 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra4p1s 4 1
ros2 run shc multit_shc intra5p1s 5 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_shc iceoryx_intra5p1s 5 1


# ZC
ros2 run shc multit_zc intra2p1s 2 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra2p1s 2 1
ros2 run shc multit_zc intra3p1s 3 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra3p1s 3 1
ros2 run shc multit_zc intra4p1s 4 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra4p1s 4 1
ros2 run shc multit_zc intra5p1s 5 1
run_rmw_iceoryx RMW_IMPLEMENTATION=rmw_iceoryx_cpp ros2 run shc multit_zc iceoryx_intra5p1s 5 1
