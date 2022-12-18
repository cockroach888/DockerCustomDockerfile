# 自撸 EMQX 镜像，抵制各种行为的技术抑制！
# 来自某位暂未跻身福布斯排行榜的软件工程师。
# 本镜像使用 Debian 操作系统，据说这是最最最专业的操作系统。
# 
# *****************************************************************************
# **  注意：（国内网络各种复杂情况，懂得都懂。）                            ***
# **  所以，非必要不采用apt-get install方式安装，而是先从官网下载软件包。   ***
# **  官方软件包地址：https://www.debian.org/distrib/packages               ***
# *****************************************************************************
#
# 制作镜像过程中，如果遇到失败、报错等，不要着急，一直重试、重试、再重试，直到成功！
#


# 基础镜像，当不存在匹配镜像时，将自动下载。
#FROM debian:11.5 AS base
FROM amd64/debian:11.5 AS base

# 镜像维护者
LABEL maintainer="cockroach888@outlook.com"

# 工作结束时
FROM base AS final


# 切换工作目录
WORKDIR /setup


# 参数定义
ARG FILENAME
ARG CPUTYPE
RUN echo ${FILENAME} && echo ${CPUTYPE}


ARG LIBNCURSES6="libncurses6_6.2+20201114-2_${CPUTYPE}.deb"
ARG LIBNCURSESW6="libncursesw6_6.2+20201114-2_${CPUTYPE}.deb"
ARG LIBPROCPS8="libprocps8_3.3.17-5_${CPUTYPE}.deb"
ARG LIBMD0="libmd0_1.0.3-3_${CPUTYPE}.deb"
ARG LIBBSD0="libbsd0_0.11.3-1_${CPUTYPE}.deb"
ARG LIBCL10N="libc-l10n_2.31-13+deb11u4_all.deb"

ARG ARG2HTTPS="apt-transport-https_2.2.4_all.deb"
ARG ARG2SSL="openssl_1.1.1n-0+deb11u3_${CPUTYPE}.deb"
ARG ARG2CA="ca-certificates_20210119_all.deb"

ARG ARG2TINI="tini_0.19.0-1_${CPUTYPE}.deb"
ARG ARG2PS="procps_3.3.17-5_${CPUTYPE}.deb"
ARG ARG2OPENBSD="netcat-openbsd_1.217-3_amd64.deb"
ARG ARG2NETCAT="netcat_1.10-46_all.deb"

ARG ARG2LOCALES="locales_2.31-13+deb11u4_all.deb"
ARG ARG2TZDATA="tzdata_2021a-1+deb11u5_all.deb"


# 复制安装包到容器目录
COPY ./setup/* /setup/


# 安装 EMQX 消息服务器
RUN dpkg -i ${FILENAME}


# 安装依赖库
RUN dpkg -i ${LIBNCURSES6} && dpkg -i ${LIBNCURSESW6} && dpkg -i ${LIBPROCPS8} && dpkg -i ${LIBMD0} && dpkg -i ${LIBBSD0} && dpkg -i ${LIBCL10N}


# 安装 HTTPS
RUN dpkg -i ${ARG2HTTPS}

# 安装 OpenSSL
RUN dpkg -i ${ARG2SSL}

# 安装 CA证书
RUN dpkg -i ${ARG2CA}


# 安装 Tini
RUN dpkg -i ${ARG2TINI}

# 安装进程查看
RUN dpkg -i ${ARG2PS}

# 安装网络连接工具
RUN dpkg -i ${ARG2OPENBSD} && dpkg -i ${ARG2NETCAT}


# 安装国际化
RUN dpkg -i ${ARG2LOCALES}

# 安装时钟同步
RUN dpkg -i ${ARG2TZDATA}


# 更新系统
RUN DEBIAN_FRONTEND=noninteractive apt-get update

# 配置国际化、清理
RUN locale-gen en_US.UTF-8 && apt-get clean && rm -rf /setup/* && rm -rf /var/lib/apt/lists/*


# 设置环境变量
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib" \
    LC_CTYPE=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# 复制入口点脚本，注意脚本文件的对齐标志，是否为Linux格式。
COPY ./bin/* /usr/bin/

# 为脚本添加权限
RUN chmod +x /usr/bin/docker-entrypoint.sh

# 添加磁盘卷
VOLUME ["/var/lib/emqx/data", "/var/log/emqx"]


# emqx will occupy these port:
# - 1883 port for MQTT
# - 8083 for WebSocket/HTTP
# - 8084 for WSS/HTTPS
# - 8883 port for MQTT(SSL)
# - 11883 port for internal MQTT/TCP
# - 18083 for dashboard and API
# - 4370 default Erlang distribution port
# - 5369 for backplain gen_rpc
EXPOSE 1883 8083 8084 8883 11883 18083 4370 5369


# 容器入口点
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "/usr/bin/docker-entrypoint.sh"]

# 执行命令
CMD ["emqx", "foreground"]