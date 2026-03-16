gnome-terminal -- bash -c "build.sh; bash bringup.sh;"
gnome-terminal -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard"
gnome-terminal -- bash -c "ros2 launch slam_toolbox online_async_launch.py use_sim_time:=true"
gnome-terminal -- bash -c "ros2 launch nav2_bringup navigation_launch.py"