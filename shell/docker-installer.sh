#!/bin/bash

# 安装 docker 参看：https://www.cnblogs.com/Alay/p/15433473.html

# 1、 装必要系统工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 2、添加软件源信息（国外服务器可以不需要这一步）
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 3、更新 yum 缓存，注意( CentOS7: sudo yum makecache fast / centos8：sudo yum makecache,我个人使用时 7 的系统使用了 8 的命令也成功了)
sudo yum makecache

# 4、安装 Docker-ce（部分 CentOS8 执行以下命令出错则需要先执行：CentOS8默认使用podman代替docker，所以需要containerd.io.）
# yum erase podman buildah
# yum install https://download.docker.com/linux/fedora/30/x86_64/stable/Packages/containerd.io-1.2.6-3.3.fc30.x86_64.rpm
sudo yum -y install docker-ce

# 5 设置开机启动docker ：
sudo systemctl enable docker && sudo systemctl start docker

# 6、修改镜像加速器为 阿里云的（国外服务器可以不需要这一步）
sudo cat > /etc/docker/daemon.json << EOF
{
  "registry-mirrors": ["https://yrxj43nx.mirror.aliyuncs.com"]
}
EOF

# 7、重启docker 镜像加速器配置：
sudo systemctl daemon-reload

# 8、重启 docker ：
sudo systemctl restart docker


# 安装完成以后查看 docker的信息
sudo docker info