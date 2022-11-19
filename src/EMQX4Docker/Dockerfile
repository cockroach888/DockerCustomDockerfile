# ��ߣ EMQX ���񣬵��Ƹ�����Ϊ�ļ������ƣ�
# ����ĳλ��δ��������˹���а����������ʦ��
# ������ʹ�� Debian ����ϵͳ����˵����������רҵ�Ĳ���ϵͳ��
# 
# *****************************************************************************
# **  ע�⣺������������ָ�����������ö�������                            ***
# **  ���ԣ��Ǳ�Ҫ������apt-get install��ʽ��װ�������ȴӹ���������������   ***
# **  �ٷ���������ַ��https://www.debian.org/distrib/packages               ***
# *****************************************************************************
#
# ������������У��������ʧ�ܡ������ȣ���Ҫ�ż���һֱ���ԡ����ԡ������ԣ�ֱ���ɹ���
#


# �������񣬵�������ƥ�侵��ʱ�����Զ����ء�
FROM debian:11.5 AS base

# ����ά����
LABEL maintainer="cockroach888@outlook.com"

# ��������ʱ
FROM base AS final


# �л�����Ŀ¼
WORKDIR /setup


# ��������
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


# ���ư�װ��������Ŀ¼
COPY ./setup/* /setup/


# ��װ EMQX ��Ϣ������
RUN dpkg -i ${FILENAME}


# ��װ������
RUN dpkg -i ${LIBNCURSES6} && dpkg -i ${LIBNCURSESW6} && dpkg -i ${LIBPROCPS8} && dpkg -i ${LIBMD0} && dpkg -i ${LIBBSD0} && dpkg -i ${LIBCL10N}


# ��װ HTTPS
RUN dpkg -i ${ARG2HTTPS}

# ��װ OpenSSL
RUN dpkg -i ${ARG2SSL}

# ��װ CA֤��
RUN dpkg -i ${ARG2CA}


# ��װ Tini
RUN dpkg -i ${ARG2TINI}

# ��װ���̲鿴
RUN dpkg -i ${ARG2PS}

# ��װ�������ӹ���
RUN dpkg -i ${ARG2OPENBSD} && dpkg -i ${ARG2NETCAT}


# ��װ���ʻ�
RUN dpkg -i ${ARG2LOCALES}

# ��װʱ��ͬ��
RUN dpkg -i ${ARG2TZDATA}


# ����ϵͳ
RUN DEBIAN_FRONTEND=noninteractive apt-get update

# ���ù��ʻ�������
RUN locale-gen en_US.UTF-8 && apt-get clean && rm -rf /setup/* && rm -rf /var/lib/apt/lists/*


# ���û�������
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib" \
    LC_CTYPE=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# ������ڵ�ű���ע��ű��ļ��Ķ����־���Ƿ�ΪLinux��ʽ��
COPY ./bin/* /usr/bin/

# Ϊ�ű�����Ȩ��
RUN chmod +x /usr/bin/docker-entrypoint.sh

# ���Ӵ��̾�
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


# ������ڵ�
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "/usr/bin/docker-entrypoint.sh"]

# ִ������
CMD ["emqx", "foreground"]