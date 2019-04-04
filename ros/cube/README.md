### how to use

- Requiremets
  - Docker(>18.09)
  - The current user is a member of the docker group or other group with docker execution rights.

- build
  - `$ export DOCKER_BUILDKIT=1`
  - `$ docker build --ssh default=ssh/id_rsa -t cube_gazebo .`
    - private repoをCloneするためDocker 18.09 以降で導入されたBuildkitのSSH機能を使う
    - [参考URL](https://www.slideshare.net/AkihiroSuda/docker-125002128)

- run
  - `$ docker run -it --rm  -v /home/gisen/ros/src:/root/ros/src cube bash`
  - (clientで)
    - `catkin build kinect2_bridge -DCMAKE_BUILD_TYPE=”Release”  -Dfreenect2_DIR=~/src/freenect2/lib/cmake/freenect2`
    - `catkin build cube -DCMAKE_BUILD_TYPE=”Release”  -Dfreenect2_DIR=~/src/freenect2/lib/cmake/freenect2`
