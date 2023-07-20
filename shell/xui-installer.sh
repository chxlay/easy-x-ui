#!/bin/bash

# 创建应用路径
sudo mkdir -p /var/appdata
# 拷贝 nginx 相关配置到挂载路径下/var/appdata/
sudo cp -r $PWD/../nginx /var/appdata/

# 拷贝 x-ui配置文件到挂在的路径下
sudo cp -r $PWD/../xui/config.json /var/appdata/x-ui/conf/config.json

# 构建 x-ui 镜像
docker-compose -f $PWD/../xui/docker/docker-compose.yml build custom-xui
# 启动服务( easy-nginx custom-xui)
docker-compose -f $PWD/../xui/docker/docker-compose.yml up easy-nginx custom-xui
