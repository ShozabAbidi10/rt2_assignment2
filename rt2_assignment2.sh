#!/bin/bash

gnome-terminal --tab --title="Gazeebo simulation" -- bash -c "source /root/my_ros/devel/setup.bash  sleep 2; roslaunch rt2_assignment1 sim_action.launch"
gnome-terminal --tab --title="go_to_point" -- bash -c " source /root/my_ros/devel/setup.bash sleep 2; rosrun rt2_assignment1 go_to_point_action.py"
