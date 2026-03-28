gnome-terminal -- bash -c "bash build.sh; bash bringup.sh;"
sleep 1;
gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard"
sleep 1;
gnome-terminal -- bash -c "ros2 run nav2_util lifecycle_bringup map_server"
sleep 1;
gnome-terminal -- bash -c "ros2 launch nav2_bringup navigation_launch.py use_sim_time:=True map:=/home/daniel/projects/foodlikeair/2wd_robot/maps/test_map/map.yaml"




#sleep 1000;
# echo "hey!!!!"


# gnome-terminal -- bash -c "ros2 launch slam_toolbox online_async_launch.py use_sim_time:=true"






# ros2 launch nav2_bringup navigation2.launch.py use_sim_time:=True map:=/path/to/your/map.yaml
