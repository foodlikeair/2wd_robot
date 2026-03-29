#!/usr/bin/env bash
# Launch the map use case in separate gnome-terminal windows.
# Based on start_map_usecase.sh but runs the exact commands requested.
set -e

gnome-terminal -- bash -c "bash build.sh; bash bringup.sh;"
sleep 2
gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard"
sleep 2
gnome-terminal -- bash -c "ros2 launch nav2_bringup bringup_launch.py use_sim_time:=True map:=/home/daniel/projects/foodlikeair/2wd_robot/maps/test_map/map.yaml"
sleep 2
# gnome-terminal -- bash -c "ros2 run rviz2 rviz2 -d /home/daniel/projects/foodlikeair/2wd_robot/src/yardguard_description/rviz/urdf_config.rviz"
gnome-terminal -- bash -c "ros2 run rviz2 rviz2 -d /home/daniel/projects/foodlikeair/2wd_robot/src/yardguard_description/rviz/map_loaded.rviz"

# sleep 2
# # gnome-terminal -- bash -c "ros2 launch slam_toolbox online_async_launch.py use_sim_time:=true"
# sleep 25
# gnome-terminal -- bash -c "ros2 run nav2_map_server map_server --ros-args --params-file /home/daniel/projects/foodlikeair/2wd_robot/maps/test_map/map_server_params.yaml"
# sleep 3
# gnome-terminal -- bash -c "ros2 run nav2_util lifecycle_bringup map_server use_sim_time:=True"

# sleep 25
# sleep 1
# gnome-terminal -- bash -c "ros2 run nav2_map_server map_server --ros-args -p yaml_filename:=/home/daniel/projects/foodlikeair/2wd_robot/maps/test_map/map.yaml"
