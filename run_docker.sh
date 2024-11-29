#!/bin/bash

# 创建并运行
# docker run -it --name ns3-hpcc -v $(pwd):/root cw-sim:sigcomm23ae

CONTAINER="ns3-hpcc"

# 检查容器状态并执行相应操作
container_status=$(docker inspect -f '{{.State.Status}}' $CONTAINER 2>/dev/null)

case $container_status in
  "paused")
    echo "Container is paused, unpausing..."
    docker unpause $CONTAINER
    ;;
  "exited"|"stopped")
    echo "Container is stopped, starting..."
    docker start $CONTAINER
    ;;
  "running")
    echo "Container is already running"
    ;;
  "")
    echo "Container does not exist"
    exit 1
    ;;
esac

# 等待容器完全启动
# sleep 2

# 执行登录
echo "Logging into container..."
docker exec -it $CONTAINER /bin/bash

