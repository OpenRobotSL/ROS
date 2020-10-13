#!/bin/sh

to_install() {
        while [ $# -ne 0 ]; do
                dpkg -s $1 > /dev/null
                if [ $? -ne 0 ]; then
                        sudo apt-get install -y $1
                fi
                shift
        done
}

# 1. Installation
# ---------------
# 1.1 Configure your Ubuntu repositories
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
sudo sed -i "/restricted$/ s/#deb\ /deb\ /"  /etc/apt/sources.list 
sudo sed -i "/restricted$/ s/#deb-src/deb-src\ /"  /etc/apt/sources.list 
sudo sed -i "/universe$/ s/#deb\ /deb\ /"  /etc/apt/sources.list 
sudo sed -i "/universe$/ s/#deb-src/deb-src/"  /etc/apt/sources.list 
sudo sed -i "/multiverse$/ s/#deb\ /deb\ /"  /etc/apt/sources.list 
sudo sed -i "/multiverse$/ s/#deb-src/deb-src/"  /etc/apt/sources.list 

# 1.2 Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# 1.3 Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# 1.4 Installation

sudo apt-get update

to_install ros-kinetic-desktop-full

# 1.5 Initialize rosdep
sudo rosdep init
rosdep update

# 1.6 Environment setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
# Since the script is to be executed in a new shell, TYPE **the command below** after this script done  
# source ~/.bashrc

# 1.7 Dependencies for building packages
to_install python-rosinstall python-rosinstall-generator python-wstool build-essential
echo
echo "To complete installation, please TYPE:"
echo "\tsource ~/.bashrc"

