#Install required ros tools
sudo apt-get install python-wstool

#Clean ROS workspace
rm src/.rosinstall
rm src/.rosinstall.bak
rm -r build
rm -r devel

#Setup ROS workspace
wstool init src
wstool merge -t src i3dr_vision.rosinstall
wstool merge -t src i3dr_vapp.rosinstall
wstool merge -t src robotiq_gripper.rosinstall
wstool merge -t src ur_arm.rosinstall
wstool update -t src
sudo apt-get install ros-kinetic-moveit
sudo apt-get install ros-kinetic-franka-description

#Install I3DR Vision dependencies
#RTABMAP
sudo apt-get install libsqlite3-dev libpcl-dev libopencv-dev git cmake libproj-dev libqt5svg5-dev
sudo apt-get install ros-kinetic-rtabmap ros-kinetic-rtabmap-ros
#sudo apt-get remove ros-kinetic-rtabmap ros-kinetic-rtabmap-ros
cd 3dr_party
git clone https://github.com/introlab/rtabmap.git
cd rtabmap/build
cmake ..
make -j4
sudo make install
cd ../../..

#Install Robotiq dependencies
#rosdep install robotiq_modbus_tcp
sudo easy_install -U pymodbus
sudo apt-get install ros-kinetic-soem

#Install Pylon dependencies
sudo sh -c 'echo "yaml https://raw.githubusercontent.com/magazino/pylon_camera/indigo-devel/rosdep/pylon_sdk.yaml " > /etc/ros/rosdep/sources.list.d/15-plyon_camera.list'
rosdep update
rosdep install --from-paths . --ignore-src --rosdistro=$ROS_DISTRO -y

#Build ROS workspace
catkin_make
#Source ROS workspace
source devel/setup.sh
