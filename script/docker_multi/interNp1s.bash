#!/bin/bash


# SC TCP
# ros2 run shc sc_tcp_sub inter2p1s_0 & ros2 run shc sc_tcp_pub inter2p1s_0 & ros2 run shc sc_tcp_pub inter2p1s_1
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter2p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter2p1s_0 && exit" 
docker exec -it shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter2p1s_1 && exit" 
sleep 2

# ros2 run shc sc_tcp_sub inter3p1s_0 & ros2 run shc sc_tcp_pub inter3p1s_0 & ros2 run shc sc_tcp_pub inter3p1s_1 & ros2 run shc sc_tcp_pub inter3p1s_2
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter3p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter3p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter3p1s_1 && exit" 
docker exec -it shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter3p1s_2 && exit" 
sleep 2

# ros2 run shc sc_tcp_sub inter4p1s_0 & ros2 run shc sc_tcp_pub inter4p1s_0 & ros2 run shc sc_tcp_pub inter4p1s_1 & ros2 run shc sc_tcp_pub inter4p1s_2 & ros2 run shc sc_tcp_pub inter4p1s_3
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter4p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter4p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter4p1s_1 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter4p1s_2 && exit" 
docker exec -it shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter4p1s_3 && exit" 
sleep 2

# ros2 run shc sc_tcp_sub inter5p1s_0 & ros2 run shc sc_tcp_pub inter5p1s_0 & ros2 run shc sc_tcp_pub inter5p1s_1 & ros2 run shc sc_tcp_pub inter5p1s_2 & ros2 run shc sc_tcp_pub inter5p1s_3 & ros2 run shc sc_tcp_pub inter5p1s_4
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter5p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter5p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter5p1s_1 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter5p1s_2 && exit" 
docker exec -d shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter5p1s_3 && exit" 
docker exec -it shc5 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter5p1s_4 && exit" 
sleep 2

# SC UDP
# ros2 run shc sc_udp_sub inter2p1s_0 & ros2 run shc sc_udp_pub inter2p1s_0 & ros2 run shc sc_udp_pub inter2p1s_1
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter2p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter2p1s_0 && exit" 
docker exec -it shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter2p1s_1 && exit" 
sleep 2

# ros2 run shc sc_udp_sub inter3p1s_0 & ros2 run shc sc_udp_pub inter3p1s_0 & ros2 run shc sc_udp_pub inter3p1s_1 & ros2 run shc sc_udp_pub inter3p1s_2
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter3p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter3p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter3p1s_1 && exit" 
docker exec -it shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter3p1s_2 && exit" 
sleep 2

# ros2 run shc sc_udp_sub inter4p1s_0 & ros2 run shc sc_udp_pub inter4p1s_0 & ros2 run shc sc_udp_pub inter4p1s_1 & ros2 run shc sc_udp_pub inter4p1s_2 & ros2 run shc sc_udp_pub inter4p1s_3
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter4p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter4p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter4p1s_1 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter4p1s_2 && exit" 
docker exec -it shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter4p1s_3 && exit" 
sleep 2

# ros2 run shc sc_udp_sub inter5p1s_0 & ros2 run shc sc_udp_pub inter5p1s_0 & ros2 run shc sc_udp_pub inter5p1s_1 & ros2 run shc sc_udp_pub inter5p1s_2 & ros2 run shc sc_udp_pub inter5p1s_3 & ros2 run shc sc_udp_pub inter5p1s_4
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter5p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter5p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter5p1s_1 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter5p1s_2 && exit" 
docker exec -d shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter5p1s_3 && exit" 
docker exec -it shc5 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter5p1s_4 && exit" 
sleep 2

# SHC
# ros2 run shc shc_sub inter2p1s_0 & ros2 run shc shc_pub inter2p1s_0 & ros2 run shc shc_pub inter2p1s_1
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter2p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter2p1s_0 && exit" 
docker exec -it shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter2p1s_1 && exit" 
sleep 2

# ros2 run shc shc_sub inter3p1s_0 & ros2 run shc shc_pub inter3p1s_0 & ros2 run shc shc_pub inter3p1s_1 & ros2 run shc shc_pub inter3p1s_2
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter3p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter3p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter3p1s_1 && exit" 
docker exec -it shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter3p1s_2 && exit" 
sleep 2

# ros2 run shc shc_sub inter4p1s_0 & ros2 run shc shc_pub inter4p1s_0 & ros2 run shc shc_pub inter4p1s_1 & ros2 run shc shc_pub inter4p1s_2 & ros2 run shc shc_pub inter4p1s_3
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter4p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter4p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter4p1s_1 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter4p1s_2 && exit" 
docker exec -it shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter4p1s_3 && exit" 
sleep 2

# ros2 run shc shc_sub inter5p1s_0 & ros2 run shc shc_pub inter5p1s_0 & ros2 run shc shc_pub inter5p1s_1 & ros2 run shc shc_pub inter5p1s_2 & ros2 run shc shc_pub inter5p1s_3 & ros2 run shc shc_pub inter5p1s_4
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter5p1s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter5p1s_0 && exit" 
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter5p1s_1 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter5p1s_2 && exit" 
docker exec -d shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter5p1s_3 && exit" 
docker exec -it shc5 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter5p1s_4 && exit" 
sleep 2
