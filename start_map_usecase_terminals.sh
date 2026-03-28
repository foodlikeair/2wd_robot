#!/usr/bin/env bash
# Launch the map use case in separate gnome-terminal windows.
# Based on start_map_usecase.sh but runs the exact commands requested.
set -e

gnome-terminal -- bash -c "bash build.sh; bash bringup.sh;"
sleep 1
gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard"
sleep 1
gnome-terminal -- bash -c "ros2 launch nav2_bringup navigation_launch.py use_sim_time:=true map:=/home/daniel/projects/foodlikeair/2wd_robot/maps/test_map/map.yaml"
sleep 1
gnome-terminal -- bash -c "ros2 launch slam_toolbox online_async_launch.py use_sim_time:=true"
sleep 25
gnome-terminal -- bash -c "ros2 run nav2_util lifecycle_bringup map_server"
sleep 1
gnome-terminal -- bash -c "ros2 run nav2_map_server map_server --ros-args -p yaml_filename:=/home/daniel/projects/foodlikeair/2wd_robot/maps/test_map/map.yaml"
