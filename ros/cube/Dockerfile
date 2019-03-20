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
    ros-kinetic-ackermann-msgs \
    ros-kinetic-serial \
    ros-kinetic-hardware-interface \
    ros-kinetic-transmission-interface \
    ros-kinetic-controller-manager \
    ros-kinetic-twist-mux \
    ros-kinetic-teleop* \
    ros-kinetic-hector-gazebo \
    ros-kinetic-ros-control \
    ros-kinetic-depthimage-to-laserscan \
    ros-kinetic-ros-controllers \
    ros-kinetic-gazebo-ros-control \
    ros-kinetic-urg-node \
    ros-kinetic-razor-imu-9dof \
    ros-kinetic-rplidar-ros \
    ros-kinetic-frontier-exploration \
    ros-kinetic-navigation \
    ros-kinetic-slam-gmapping \
    ros-kinetic-rosbridge-server \
    ros-kinetic-rosbridge-suite \
    ros-kinetic-robot-pose-publisher \
    ros-kinetic-teleop-twist-joy \
    ros-kinetic-pointcloud-to-laserscan \
    ros-kinetic-velodyne-gazebo-plugins \
    ros-kinetic-teleop-twist-keyboard \
    ros-kinetic-yocs-velocity-smoother \
    ros-kinetic-explore-lite \
    ros-kinetic-hector-compressed-map-transport \
    python-pymodbus \
    ros-kinetic-ar-track-alvar \
    ros-kinetic-py-trees \
    wget \
    ssh \
    python-catkin-tools \
    python-rosdep \
    python-setuptools \
    python-wstool \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.ssh
ADD ssh/id_rsa /root/.ssh
ADD ssh/id_rsa.pub /root/.ssh
RUN ssh -o StrictHostKeyChecking=no github.com; exit 0
RUN cd ~ && \
    mkdir -p ros/src && \
    cd ros/src && \
    wstool init && \
    wstool set -y --git sbgisen/sbgisen_wiki -v master git@github.com:sbgisen/sbgisen_wiki.git && \
    wstool set -y --git sbgisen/cube         -v develop git@github.com:sbgisen/cube.git && \
    wstool set -y --git vesc                 -v master git@github.com:mit-racecar/vesc.git && \
    wstool set -y --git racecar              -v master git@github.com:mit-racecar/racecar.git && \
    wstool set -y --git quanergy_client_ros  -v master git@github.com:sbgisen/quanergy_client_ros.git && \
    wstool set -y --git pico_flexx_driver    -v master git@github.com:sbgisen/pico_flexx_driver.git && \
    wstool set -y --git ar_docking -v master git@github.com:sbgisen/ar_docking.git && \
    wstool set -y --git ros_controllers      -v master git@github.com:sbgisen/ros_controllers.git && \
    wstool set -y --git hector_slam      -v catkin git@github.com:sbgisen/hector_slam.git && \
    wstool set -y --git mpu6050_serial_to_imu -v master git@github.com:sbgisen/mpu6050_serial_to_imu.git && \
    wstool update
RUN rosdep update
# /opt/ros/$ROS_DISTRO/share can be changed after rosdep install, so we run it 3 times.
RUN for i in $(seq 3); do rosdep install --rosdistro $ROS_DISTRO -r -y -i --from-paths /opt/ros/$ROS_DISTRO/share ~/ros/src; done
RUN rm -rf ~/ros/src
