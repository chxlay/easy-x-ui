#!/bin/bash
# 参考 https://www.cnblogs.com/Alay/p/15433907.html
# 下载 docker-compose 在 opt路径下执行
sudo curl -SLO https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-linux-x86_64

sudo ./docker-compose-linux-x86_64 /usr/local/bin/docker-compose

# 4、赋予权限：
sudo chmod +x /usr/local/bin/docker-compose

# 安装完成以后查看版本信息
docker-compose -v