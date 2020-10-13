#!/bin/sh
# Install the prerequisites for the ROS exploring code



 sudo apt-get install ros-kinetic-manipulation-msgs 
 sudo apt-get install ros-kinetic-moveit-msgs
 sudo apt-get install ros-kinetic-moveit-ros-perception
 sudo apt-get install ros-kinetic-moveit-ros-planning-interface 
 sudo apt-get install ros-kinetic-move-base-msgs
 sudo apt-get install ros-kinetic-gazebo-ros-control
 sudo apt-get install ros-kinetic-arbotix-*
 git clone http://github.com/vanadiumlabs/arbotix_ros.git


sudo apt update
sudo apt-get install ros-kinetic-move-base
sudo apt-get install ros-kinetic-map-server
