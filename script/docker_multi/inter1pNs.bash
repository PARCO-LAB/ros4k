#!/bin/bash

# # SC TCP
# # ros2 run shc sc_tcp_sub inter1p2s_0 & ros2 run shc sc_tcp_sub inter1p2s_1 & ros2 run shc sc_tcp_pub inter1p2s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p2s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p2s_1 && exit" 
# docker exec -it shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter1p2s_0 && exit" 
# sleep 2

# # ros2 run shc sc_tcp_sub inter1p3s_0 & ros2 run shc sc_tcp_sub inter1p3s_1 & ros2 run shc sc_tcp_sub inter1p3s_2 & ros2 run shc sc_tcp_pub inter1p3s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p3s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p3s_1 && exit" 
# docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p3s_2 && exit" 
# docker exec -it shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter1p3s_0 && exit" 
# sleep 2

# # ros2 run shc sc_tcp_sub inter1p4s_0 & ros2 run shc sc_tcp_sub inter1p4s_1 & ros2 run shc sc_tcp_sub inter1p4s_2 & ros2 run shc sc_tcp_sub inter1p4s_3 & ros2 run shc sc_tcp_pub inter1p4s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p4s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p4s_1 && exit" 
# docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p4s_2 && exit" 
# docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p4s_3 && exit" 
# docker exec -it shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter1p4s_0 && exit" 
# sleep 2

# # ros2 run shc sc_tcp_sub inter1p5s_0 & ros2 run shc sc_tcp_sub inter1p5s_1 & ros2 run shc sc_tcp_sub inter1p5s_2 & ros2 run shc sc_tcp_sub inter1p5s_3 & ros2 run shc sc_tcp_sub inter1p5s_4 & ros2 run shc sc_tcp_pub inter1p5s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p5s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p5s_1 && exit" 
# docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p5s_2 && exit" 
# docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p5s_3 && exit" 
# docker exec -d shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p5s_4 && exit" 
# docker exec -it shc5 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter1p5s_0 && exit" 
# sleep 2


# # SC UDP
# # ros2 run shc sc_udp_sub inter1p2s_0 & ros2 run shc sc_udp_sub inter1p2s_1 & ros2 run shc sc_udp_pub inter1p2s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p2s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p2s_1 && exit" 
# docker exec -it shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter1p2s_0 && exit" 
# sleep 2

# # ros2 run shc sc_udp_sub inter1p3s_0 & ros2 run shc sc_udp_sub inter1p3s_1 & ros2 run shc sc_udp_sub inter1p3s_2 & ros2 run shc sc_udp_pub inter1p3s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p3s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p3s_1 && exit"
# docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p3s_2 && exit" 
# docker exec -it shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter1p3s_0 && exit"
# sleep 2

# # ros2 run shc sc_udp_sub inter1p4s_0 & ros2 run shc sc_udp_sub inter1p4s_1 & ros2 run shc sc_udp_sub inter1p4s_2 & ros2 run shc sc_udp_sub inter1p4s_3 & ros2 run shc sc_udp_pub inter1p4s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p4s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p4s_1 && exit"
# docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p4s_2 && exit" 
# docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p4s_3 && exit" 
# docker exec -it shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter1p4s_0 && exit"
# sleep 2

# # ros2 run shc sc_udp_sub inter1p5s_0 & ros2 run shc sc_udp_sub inter1p5s_1 & ros2 run shc sc_udp_sub inter1p5s_2 & ros2 run shc sc_udp_sub inter1p5s_3 & ros2 run shc sc_udp_sub inter1p5s_4 & ros2 run shc sc_udp_pub inter1p5s_0
# docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p5s_0 && exit" 
# docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p5s_1 && exit"
# docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p5s_2 && exit" 
# docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p5s_3 && exit" 
# docker exec -d shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p5s_4 && exit" 
# docker exec -it shc5 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter1p5s_0 && exit"
# sleep 2

# SHC
# ros2 run shc shc_sub inter1p2s_0 & ros2 run shc shc_sub inter1p2s_1 & ros2 run shc shc_pub inter1p2s_0
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p2s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p2s_1 && exit" 
docker exec -it shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter1p2s_0 && exit" 
sleep 2

# ros2 run shc shc_sub inter1p3s_0 & ros2 run shc shc_sub inter1p3s_1 & ros2 run shc shc_sub inter1p3s_2 & ros2 run shc shc_pub inter1p3s_0
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p3s_0 && exit"
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p3s_1 && exit"
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p3s_2 && exit" 
docker exec -it shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter1p3s_0 && exit"
sleep 2

# ros2 run shc shc_sub inter1p4s_0 & ros2 run shc shc_sub inter1p4s_1 & ros2 run shc shc_sub inter1p4s_2 & ros2 run shc shc_sub inter1p4s_3 & ros2 run shc shc_pub inter1p4s_0
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p4s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p4s_1 && exit"
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p4s_2 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p4s_3 && exit" 
docker exec -it shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter1p4s_0 && exit"
sleep 2

# ros2 run shc shc_sub inter1p5s_0 & ros2 run shc shc_sub inter1p5s_1 & ros2 run shc shc_sub inter1p5s_2 & ros2 run shc shc_sub inter1p5s_3 & ros2 run shc shc_sub inter1p5s_4 & ros2 run shc shc_pub inter1p5s_0
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p5s_0 && exit" 
docker exec -d shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p5s_1 && exit"
docker exec -d shc2 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p5s_2 && exit" 
docker exec -d shc3 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p5s_3 && exit" 
docker exec -d shc4 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p5s_4 && exit" 
docker exec -it shc5 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter1p5s_0 && exit"
sleep 2
