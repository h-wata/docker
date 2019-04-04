# syntax = docker/dockerfile:1.0-experimental

FROM osrf/ros:kinetic-desktop-full-xenial
 
ENV ROS_DISTRO=kinetic

RUN apt-get update \
  && apt-get install -y \
    apt-utils \
    git \
    build-essential \
    checkinstall \
    software-properties-common \
    libpcl-dev \
    ros-kinetic-rqt* \
    ros-kinetic-py-trees \
    wget \
    ssh \
    openssh-client \
    python-catkin-tools \
    python-rosdep \
    python-setuptools \
    python-wstool \
    libboost-all-dev
  # && apt-get clean \
  # && rm -rf /var/lib/apt/lists/*

RUN mkdir -p -m 0700 ~/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh mkdir -p ~/lib && \
    cd ~/lib && \
    git clone git@github.com:sbgisen/quanergy_client.git && \
    mkdir quanergy_client/build && \
    cd quanergy_client/build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j2 && \
    checkinstall -y --pkgname='quanergy_client'

RUN mkdir -p ~/lib && \
    cd ~/lib && \
    git clone https://anongit.freedesktop.org/git/beignet.git && \
    cd beignet && \
    # build tool
    apt -y install cmake pkg-config python ocl-icd-dev libegl1-mesa-dev ocl-icd-opencl-dev libdrm-dev libxfixes-dev libxext-dev llvm-3.6-dev clang-3.6 libclang-3.6-dev libtinfo-dev libedit-dev zlib1g-dev && \
    # Build
    mkdir -p build && \
    cd build/ && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j8 && \
    checkinstall -y --pkgname='libbeignet'

RUN mkdir -p ~/lib && \
    cd ~/lib && \
    git clone https://github.com/OpenKinect/libfreenect2.git && \
    cd libfreenect2&& \
    # build tool
    apt -y install pkg-config libusb-1.0-0-dev libturbojpeg libjpeg-turbo8-dev libglfw3-dev && \
    # Build
    mkdir -p build && \
    cd build/ && \
    cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/src/freenect2 && \
    cmake .. -Dfreenect2_DIR=$HOME/src/freenect2/lib/cmake/freenect2 && \
    make -j8 && \
    checkinstall -y --pkgname='libfreenect2'

RUN --mount=type=ssh cd ~ && \
    mkdir -p ros/src && \
    cd ros/src && \
    wstool init && \
    wstool set -y --git scib_can_interface_subscriber -v master git@github.com:sbgisen/SCIB_CAN_interface_Subscriber.git && \
    wstool set -y --git akulidar_ros -v master git@github.com:sbgisen/akulidar_ros.git && \
    wstool set -y --git sbgisen/cube         -v develop git@github.com:sbgisen/cube.git && \
    wstool set -y --git vesc                 -v master git@github.com:mit-racecar/vesc.git && \
    wstool set -y --git racecar              -v master git@github.com:mit-racecar/racecar.git && \
    wstool set -y --git quanergy_client_ros  -v master git@github.com:sbgisen/quanergy_client_ros.git && \
    wstool set -y --git pico_flexx_driver    -v master git@github.com:sbgisen/pico_flexx_driver.git && \
    wstool set -y --git ar_docking -v master git@github.com:sbgisen/ar_docking.git && \
    wstool set -y --git ros_controllers      -v master git@github.com:sbgisen/ros_controllers.git && \
    wstool set -y --git hector_slam      -v catkin git@github.com:sbgisen/hector_slam.git && \
    wstool set -y --git mpu6050_serial_to_imu -v master git@github.com:sbgisen/mpu6050_serial_to_imu.git && \
    wstool set -y --git rospeex -v kinetic https://bitbucket.org/rospeex/rospeex.git && \
    wstool set -y --git iai_kinect2 -v master https://github.com/code-iai/iai_kinect2.git && \
    wstool update
RUN rosdep update
# /opt/ros/$ROS_DISTRO/share can be changed after rosdep install, so we run it 3 times.
RUN for i in $(seq 3); do rosdep install --rosdistro $ROS_DISTRO -r -y -i --from-paths /opt/ros/$ROS_DISTRO/share ~/ros/src; done

RUN cd ~/ros && \
    catkin init && \
    catkin config --extend /opt/ros/kinetic && \
    catkin config --no-blacklist && \
    catkin config -a --blacklist effort_controllers force_torque_sensor_controller forward_command_controller gripper_action_controller imu_sensor_controller joint_state_controller joint_trajectory_controller position_controllers ros_controllers rqt_joint_trajectory_controller velocity_controllers voice_server
RUN rm -rf ~/ros/src
