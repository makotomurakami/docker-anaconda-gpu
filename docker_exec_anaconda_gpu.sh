#!/bin/bash

home=$(echo ~)
pwd=$(pwd)
user=$(id -un)
sudo docker exec -ti anaconda_gpu /bin/bash
