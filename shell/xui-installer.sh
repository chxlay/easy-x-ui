#!/bin/bash

# 创建应用路径
sudo mkdir -p /var/appdata
# 拷贝 nginx 相关配置到挂载路径下
sudo cp -r $PWD/../nginx /var/appdata/

# 启动服务
docker-compose -f $PWD/../xui/docker/docker-compose.yml up
