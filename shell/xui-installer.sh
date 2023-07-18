#!/bin/bash

# 拷贝 nginx 相关配置到挂载路径下
sudo cp $PWD/../nginx /var/appdata/

# 启动服务
docker-compose -f $PWD/../xui/docker/docker-compose.yml up