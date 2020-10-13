#!/bin/sh
# Install the prerequisites for the ROS exploring code

#虚拟机安装配置文件(不报错不用安装)
git --version
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
git --version


sudo apt-get install python-pip
sudo python -m pip install pylint

#gazebo无法启动时候 需要设置虚拟机参数，（并且在外面关闭3D图形卡）
echo " export SVGA_VGPU10=0" >> ~/.bashrc
source ~/.bashrc
