#!/bin/bash

home=$(echo ~)
pwd=$(pwd)
user=$(id -un)
sudo docker run -ti --rm --runtime=nvidia -e DISPLAY=$DISPLAY -e XMODIFIERS=$XMODIFIERS -v /tmp/.X11-unix/:/tmp/.X11-unix -v $home:$home -w $pwd -u $user --privileged -v /dev/video0:/dev/video0 --name anaconda_gpu anaconda_gpu
