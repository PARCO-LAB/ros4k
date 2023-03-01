#!/bin/bash

# SC TCP
ros2 run shc sc_tcp_sub inter1p1s_0 & ros2 run shc sc_tcp_pub inter1p1s_0
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_sub inter1p1s_0 && exit" 
docker exec -it shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_tcp_pub inter1p1s_0 && exit"
sleep 2

# SC UDP
# ros2 run shc sc_udp_sub inter1p1s_0 & ros2 run shc sc_udp_pub inter1p1s_0 
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_sub inter1p1s_0 && exit" 
docker exec -it shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc sc_udp_pub inter1p1s_0 && exit"
sleep 2

# SHC
# ros2 run shc shc_sub inter1p1s_0 & ros2 run shc shc_pub inter1p1s_0 
docker exec -d shc0 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_sub inter1p1s_0 && exit" 
docker exec -it shc1 bash -c "cd docker && source /opt/ros/eloquent/setup.bash && . /ros_ws/install/setup.bash && ros2 run shc shc_pub inter1p1s_0 && exit"
echo "End"
