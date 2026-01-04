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
