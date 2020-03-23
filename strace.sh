#!/bin/sh

if [ "$1" = "" ];
then
  echo "Usage: strace.sh <CONTAINER_ID>";
else
  docker run -it --pid=container:$1 \
    --net=container:$1 \
    --cap-add sys_admin \
    --cap-add sys_ptrace \
    strace
fi
