#YardGuard

Launch example urdf:
```
sudo apt install ros-jazzy-urdf-tutorial
ros2 launch urdf_tutorial display.launch.py model:=/home/daniel/projects/yard_guard/ex/my_robot.urdf
```

### Create new package
```
ros2 pkg create my_py_pkg --build-type ament_python --dependencies rclpy
```

### Run in gazebo
```bash build.sh; bash bringup.sh;
In a different terminal
```ros2 run teleop_twist_keyboard teleop_twist_keyboard```
Control programatically
```
ros2 topic pub -r 1 /cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.5}, angular: {z: 0.5}}"
ros2 topic pub -r 1 /cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.0}, angular: {z: 0.0}}"
```
Start SLAM
```
ros2 launch slam_toolbox online_async_launch.py use_sim_time:=True
```

### Add camera sensor
1. Add xacro file for camera definition
2. Create gazebo bridge in gazebo_bridge.yaml file
3. Add sensor plugin to the world map you want the camera sensor to work in
4. To get camera feed, add camera in rviz, define the camera topic

### Good sources for how to link laser/scan
https://github.com/ROBOTIS-GIT/turtlebot3_simulations/blob/9be186fb03d84ed4f293e5c0db71d8c05bbc91f3/turtlebot3_gazebo/params/turtlebot3_waffle_bridge.yaml#L3
https://github.com/turtlebot/turtlebot4/blob/jazzy/turtlebot4_description/urdf/sensors/rplidar.urdf.xacro
https://github.com/turtlebot/turtlebot4/blob/jazzy/turtlebot4_description/urdf/sensors/rplidar.urdf.xacro

### Generate frames
```ros2 run tf2_tools view_frames```

### Launch yardguard with SLAM
Run all commands in order in their own respective terminal windows
1. ```bash build.sh; bash bringup.sh;```
2. ```ros2 run teleop_twist_keyboard teleop_twist_keyboard```
3. ```ros2 launch nav2_bringup navigation_launch.py```
4. ```ros2 launch slam_toolbox online_async_launch.py use_sim_time:=true```

### Launch yardguard with mock motors
1. ```ros2 launch yardguard_bringup mock_motor.launch.xml```
2. ``` ros2 run teleop_twist_keyboard  teleop_twist_keyboard --ros-args -r /cmd_vel:=/diff_drive_controller/cmd_vel -p stamped:=true ```

### Useful resources
How to connect odrive micros to everything
https://docs.odriverobotics.com/v/latest/guides/arduino-can-guide.html
https://www.youtube.com/watch?v=BqNmjZ8Cibc
https://discourse.odriverobotics.com/t/can-communication-on-odrives-using-arduino/11910 




### To save a generated map
```ros2 run nav2_map_server map_saver_cli -f /home/daniel/Desktop/maps/mymap```


### Todos
1. Generate a map and save it
2. Load the generated map and use it in conjunction with laser scanner

## When starting hardware for botwheel explorer.
1. Make sure power is plugged in first, then plug usb
`sudo ip link set can0 up type can bitrate 250000`
`bash build_diffbot.sh`
`ros2 launch odrive_botwheel_explorer botwheel_explorer.launch.py`
`ros2 run teleop_twist_keyboard  teleop_twist_keyboard --ros-args -r /cmd_vel:=/botwheel_explorer/cmd_vel -p stamped:=true`

