#!/bin/bash

# 安装 docker 环境
sudo chmod +x ./docker-installer.sh && ./docker-installer.sh

# 给当前用户（非 root 用户）赋予 docker 的执行权限
sudo usermod -aG docker $USER

# 安装docker-compose 环境
sudo chmod +x ./compose-installer.sh && ./compose-installer.sh

# 重启电脑
sudo reboot