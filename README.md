# Assignment 2 of the Research Track 2 course (MSc Robotics Engineering, Unige)

The following repository contains the packages and the simulation environment for controlling a mobile robot in the Gazebo simulator with improved user interface developed in Jupyter Notebook.

## Project Installation:

This project requires both ROS1 to be install in the system. Please make sure you have it installed before following the instructions. There are three branches in this respository, the first branch "main" and the second branch "sphinx" are exactly the same project but with different style of documentation. The documentation in the "main" branch is done using Doxygen and in the second "sphinx" branch the documentation in done using sphinx tool.

1. Code available in **Main** branch is a ROS1 package should be install in ROS1 workspace {ros1_ws}/src and to deploy successfully run the following command.
```
catkin_make
cd devel/
source setup.bash
```
3. Code available in **ros2** branch is a ROS2 package should be install in ROS2 workspace {ros2_ws}/src and to deploy successfully run the following command.
```
colcon build --packages-select rt2assignment_package
cd install/
source local_setup.bash
```
5. Code available in **sourcefiles** branch is a set of source files that will be required to run the project. Please install them in your /root directory. Once the branch is cloned make all these files executable by running the following command for each of the bash files.
```
chmod +x <file_name>
```
5. This project requires both Gazebo and Vrep simulation environments, if they are not already installed in your system please install them by following given instructions: 

  **For Gazebo :** 
  
  * Please follow the instructions available on the respository.http://gazebosim.org/tutorials?tut=install_ubuntu
## Part 1: Running Mobile Robot Simulation in Gazeboo using action server.

Part1 of the project is consist of four main nodes. 

1. position_service 
2. state_machine_action 
3. go_to_point_action.py
4. user_interface_action.py

'user_interface_action' node communicates with the user and as per the provided commands, instruct the system to behave accordingly. If the user press 1 in the terminal, it request '/user interface' service which is host by 'state_machine_action.py' node. Letting the node know that user have request for mobile robot to move. Therefore, upon receiving the service request from 'user interface' node it request another service '/position server' which is hosted by 'position service' node to randomly generate goal coordinates for the robot to follow. Once it receives the goal coordinates in response to the earlier request to '/position service' service, it pass these goal coordinates to an action service "/go_to_point" which is host by 'go_to_point_action.py' node. Once ‘go_to_point_action.py’ node receives the goal coordinate it start computing required linear and angular velocity values for robot to reach that point and meanwhile start publishing it on ‘cmd_vel’ topic which subscribed by Gazeebo. Since ‘/go_to_point’ is an action service therefore the user has the option to request cancelling the goal at any point during the execution. And for this purpose the ‘user interface’ node ask the user to press 0 in order to cancel the goal. 

In order to run this part please make sure you are in /root folder where you have already downloaded **rt2_assignment_1a.sh** bash file. Open the terminal and run the following command.

```
./rt2_assignment_1a.sh
```
After doing this you will see three terminal windows start appearing on the screen, including a Gazebo simulation with a mobile robot in it. Wait for the system load all the files. Find the terminal window with title **user_interface** which will be asking to press 1. Upon pressing 1, the mobile robot will start moving towards the randomly generated goal target. And if during the execution of this goal if you press 0 the robot will stop immediately. 

