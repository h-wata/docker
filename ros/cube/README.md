### how to use

- build
  - `docker build -t cube`
- run
  - `$ docker run -it --rm  -v /home/gisen/ros/src:/root/ros/src cube bash`
  - (clientで)
    - `catkin build kinect2_bridge -DCMAKE_BUILD_TYPE=”Release”  -Dfreenect2_DIR=~/src/freenect2/lib/cmake/freenect2`
    - `catkin build cube -DCMAKE_BUILD_TYPE=”Release”  -Dfreenect2_DIR=~/src/freenect2/lib/cmake/freenect2`
