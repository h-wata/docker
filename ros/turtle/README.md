## HOW TO USE
 - 参考
   - https://qiita.com/ryo_21/items/4e0006adcb300173acda
   - https://qiita.com/ryoya-s/items/ee1daf9cab18c100c990
### GUIの起動
 1. Xqurtzの起動,roscoreの起動
     ```
    $ open -a Xqurtz
    $ ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    $ echo $ip
    $ xhost + $ip
     ```
 1. socatの起動
   - 導入
   ` brew install socat `
   - 実行
   ` $ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"`
### rosnodeの起動
 1.  rosmaster起動
     ```
     $ docker run --rm -e DISPLAY=$ip:0 --name ros-test ros-tutorials roscore
     ```
 1. turtlesim_node
     ```
     # hostのMac内
     docker exec -it ros-test bin/bash
     # 上で立ち上げたコンテナ内部
     source opt/ros/kinetic/setup.bash
     rosrun turtlesim turtlesim_node
     ```
 1. turtl_teleop_node
     ```
     # hostのMac内
     docker exec -it ros-test bin/bash
     # 上で立ち上げたコンテナ内部
     source opt/ros/kinetic/setup.bash
     rosrun turtlesim turtle_teleop_key
     ```
