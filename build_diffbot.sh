source ~/.bashrc
ros2 run xacro xacro -o /home/daniel/projects/foodlikeair/2wd_robot/src/yardguard_description/urdf/output/yardguard.urdf /home/daniel/projects/foodlikeair/2wd_robot/src/yardguard_description/urdf/diffbot.xacro;
colcon build;
source ~/.bashrc

