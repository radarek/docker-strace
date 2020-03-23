# How to run `strace` command on docker?

Based on https://medium.com/@rothgar/how-to-debug-a-running-docker-container-from-a-separate-container-983f11740dc6.

## Build docker image with `strace` command

```
docker build -t strace .
```

## Run docker container

```
docker run -t --pid=container:<CONTAINER_ID> \
  --net=container:<CONTAINER_ID> \
  --cap-add sys_admin \
  --cap-add sys_ptrace \
  strace
```

`CONTAINER_ID` is an ID or name of container which you want to strace process from. You can then `ps aux` to see all container processes and choose which process to strace. Then run `strace` command as usual `strace -p <PID>`.
