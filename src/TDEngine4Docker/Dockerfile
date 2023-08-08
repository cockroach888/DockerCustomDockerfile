# 自撸 TDEngine 镜像，抵制各种行为的技术抑制！
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
FROM debian:11.7 AS base

# 镜像维护者
LABEL maintainer="cockroach888@outlook.com"

# 工作结束时
FROM base AS final


# 切换工作目录
WORKDIR /setup


# 参数定义
ARG FILENAME
RUN echo ${FILENAME}



# 复制安装包到容器目录
COPY ./setup/* /setup/


# 安装 TDEngeing 数据库
RUN dpkg -i ${FILENAME}


# 更新系统
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /tini
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y locales tzdata netcat curl gdb vim tmux less net-tools valgrind

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
RUN chmod +x /tini
RUN chmod +x /usr/bin/entrypoint.sh

# 容器入口点
ENTRYPOINT ["/tini", "--", "/usr/bin/entrypoint.sh"]

# 执行命令
CMD ["taosd"]

# 添加磁盘卷
VOLUME [ "/var/lib/taos", "/var/log/taos", "/corefile" ]
