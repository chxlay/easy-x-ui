# 选择 Linux 版本 https://hub.docker.com
FROM centos:centos7

# x-ui 版本
ARG VERSION
ARG CPU

# 设置环境变量，用于在容器中运行systemd
ENV container docker

# 安装systemd
RUN yum install -y systemd

# 设置默认的运行级别为multi-user.target
RUN systemctl set-default multi-user.target

# 删除不必要的服务
RUN rm -f /etc/systemd/system/sysinit.target.wants/* \
          /lib/systemd/system/multi-user.target.wants/* \
          /lib/systemd/system/local-fs.target.wants/* \
          /lib/systemd/system/sockets.target.wants/*udev* \
          /lib/systemd/system/sockets.target.wants/*initctl* \
          /lib/systemd/system/basic.target.wants/* \
          /lib/systemd/system/anaconda.target.wants/*

# 工作路径创建
RUN set -x \
    && mkdir /home/x-ui -p

# Node 环境的工作目录
WORKDIR /home/x-ui

# 下载 x-ui压缩包
#https://github.com/vaxilu/x-ui/releases/download/0.3.2/x-ui-linux-amd64.tar.gz
#https://github.com/vaxilu/x-ui/releases/download/0.3.2/x-ui-linux-arm64.tar.gz
RUN curl -SLO https://github.com/vaxilu/x-ui/releases/download/${VERSION}/x-ui-linux-${CPU}.tar.gz

# 解压下载的文件
RUN set -x \
    && tar -zxvf x-ui-linux-${CPU}.tar.gz \
    # 解压玩之后删除压缩包
    && rm -rf x-ui-linux-${CPU}.tar.gz

# 执行安装和启动
RUN set -x \
    && chmod +x x-ui/x-ui x-ui/bin/xray-linux-* x-ui/x-ui.sh \
    && cp x-ui/x-ui.sh /usr/bin/x-ui \
    && cp -f x-ui/x-ui.service /etc/systemd/system/ \
    && mv x-ui/ /usr/local/

# 服务端口号暴露
EXPOSE 54321
# 配置文件、日志文件挂载暴露挂载
VOLUME ["/usr/local/x-ui/bin/config.json","/usr/local/x-ui/logs"]

WORKDIR /usr/local/x-ui

# 启动服务
ENTRYPOINT ["/usr/sbin/init"]
# 启动 x-ui 应用
ENTRYPOINT ["systemctl daemon-reload && systemctl enable x-ui"]
CMD ["systemctl restart x-ui"]
