# Moveit Config (UR10 + Robotiq 2F-85)

This guide will go through the steps needed to create a moveit configuration for the UR10 and Robotiq 2F-85

## Installation
Setup ROS workspace
```bash
mkdir ~/catkin_ws
mkdir ~/catkin_ws/src
cd ~/catkin_ws
catkin_make
```

Install moveit packages
```bash
sudo apt-get install ros-$ROS_DISTRO-moveit
sudo apt-get install ros-$ROS_DISTRO-franka-description
```
Install Universal Robots
```bash
sudo apt-get install ros-$ROS_DISTRO-universal-robot
```

Install Robotiq dependencies
```bash
sudo easy_install -U pymodbus
sudo apt-get install ros-$ROS_DISTRO-soem
```
Install Robotiq package
```
git clone https://github.com/ros-industrial/robotiq.git
rosdep install --from-paths . --ignore-src --rosdistro=$ROS_DISTRO -y
```

## Configuration

**Launch moveit setup assistant**
```bash
roslaunch moveit_setup_assistant setup_assistant.launch
```
