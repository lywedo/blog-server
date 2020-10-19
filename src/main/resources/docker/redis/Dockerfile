#
# Redis Dockerfile
#
# https://github.com/dockerfile/redis
#
#指定创建的基础镜像
FROM ubuntu:18.04

#作者描述信息
MAINTAINER lam
#安装deb软件包时，某些软件将tzdata作为依赖项安装,tzdata会以交互方式提醒用户选择使用位置,将tzdata设置为非交互方式
ENV DEBIAN_FRONTEND=noninteractive \
    REDIS_VERSION=4.0.9 \
    REDIS_USER=redis \
    REDIS_DATA_DIR=/var/lib/redis \
    REDIS_LOG_DIR=/var/log/redis
#更新源、安装openssh 并修改配置文件和生成key
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y redis-server=5:${REDIS_VERSION}* \
    && sed 's/^bind /# bind /' -i /etc/redis/redis.conf \
    && sed 's/^logfile /# logfile /' -i /etc/redis/redis.conf \
    && sed 's/^daemonize yes/daemonize no/' -i /etc/redis/redis.conf \
    && sed 's/^protected-mode yes/protected-mode no/' -i /etc/redis/redis.conf \
    && sed 's/^# unixsocket /unixsocket /' -i /etc/redis/redis.conf \
    && sed 's/^# unixsocketperm 700/unixsocketperm 777/' -i /etc/redis/redis.conf \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 6379/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]