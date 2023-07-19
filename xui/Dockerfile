# 选择 Linux 版本 https://hub.docker.com
FROM centos:centos7.8.2003

# x-ui 版本
ARG VERSION
ARG CPU

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


# 端口号暴露
EXPOSE 54321

# 启动服务
ENTRYPOINT "systemctl daemon-reload"
ENTRYPOINT "systemctl enable x-ui"

CMD "systemctl restart x-ui"
