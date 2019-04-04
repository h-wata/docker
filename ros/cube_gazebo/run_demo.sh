#!/usr/bin/env bash

# Runs a docker container with the image created by build_demo.bash
# Requires
#   docker
#   nvidia-docker2
#   an X server

until nvidia-docker ps
do
    echo "Waiting for docker server"
    sleep 1
done

mkdir -p /tmp/cube_rocker_venv
python3 -m venv /tmp/cube_rocker_venv
. /tmp/cube_rocker_venv/bin/activate
pip install -U git+https://github.com/osrf/rocker.git


rocker --nvidia  --x11 --network=host cube_gazebo
