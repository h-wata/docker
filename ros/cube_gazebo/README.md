### how to use

- Requiremets
  - X server
  - Docker(>18.09)
  - [nvidia-docker2](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))
  - The current user is a member of the docker group or other group with docker execution rights.
- build
  - `$ export DOCKER_BUILDKIT=1`
  - `$ docker build --ssh default=ssh/id_rsa -t cube_gazebo .`
    - private repoをCloneするためDocker 18.09 以降で導入されたBuildkitのSSH機能を使う
    - [参考URL](https://www.slideshare.net/AkihiroSuda/docker-125002128)
- run
  - `$ ./run_demo.sh`
