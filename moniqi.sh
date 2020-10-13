#!/bin/sh
# Install the prerequisites for the ROS exploring code

#安装rbx1
cd ~/catkin_ws/src
git clone https://github.com/pirobot/rbx1.git 
cd ..
catkin_make
rospack profile

#安装Arbotix模拟器
cd ~/catkin_ws/src

git clone  https://github.com/vanadiumlabs/arbotix_ros.git

cd ..

catkin_make

#3.测试模拟器
#a.在一个新的终端输入roscore 
#b.在一个新的终端输入roslaunch rbx1_bringup fake_turtlebot.launch启动机器人 
#无法运行下面的命令

#有如下提示：

#[ INFO] [1451984745.493709006]: rviz version 1.10.16
#[ INFO] [1451984745.493760424]: compiled against OGRE version 1.7.4 (Cthugha)
#ERROR: the config file '/home/exbot/catkin_ws/src/rbx1/rbx1_nav/sim_fuerte.vcg' is a .vcg file, #which is the old rviz config format.
       New config files have a .rviz extension and use YAML formatting.  The format changed
       between Fuerte and Groovy.  There is not (yet) an automated conversion program.

#发现新版本已经不知吃.vcg格式，后查看rbx1的目录发现可以使用下面的指令解决
#            rosrun rviz rviz -d `rospack find rbx1_nav`/sim.rviz   

#c.调出RViz查看模拟的机器人rosrun rviz rviz -d 'rospack find rbx1_nav'/sim.rviz  .rviz类型。

   首先运行机器人节点：[plain] view plaincopy

roslaunch rbx1_bringup fake_turtlebot.launch
 

        然后运行amcl节点，使用测试地图：        [plain] view plaincopy

roslaunch rbx1_nav fake_amcl.launch map:=test_map.yaml

 然后运行rviz：[plain] view plaincopy

rosrun rviz rviz -d `rospack find rbx1_nav`/nav_test.rviz
xxxxx.rivz  #注意这里是` 不是 '

#d.让机器人顺时针转圈rostopic pub -r 10 /cmd_vel geometry_msgs/Twist '{linear: {x: 0.1,y: 0,z: #0},angular: {x: 0,y: 0,z: 0}}'(这里需要注意的是变量名和值之间必须要有一个空格) 
#e.ctrl+c终止终端,发送空的消息rostopic pub -r 10 /cmd_vel geometry_msgs/Twist '{}'

至此已经成功安装了模拟器

