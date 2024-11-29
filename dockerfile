FROM ubuntu:16.04
ARG DEBIAN_FRONTEND=noninteractive

# 替换为阿里云的源
# RUN echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list && \
#     echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list


# 更新并安装所需的软件包
RUN apt update && apt install -y gnuplot python python3 python3-pip libgtk-3-0 bzip2 wget git && \
    rm -rf /var/lib/apt/lists/*
    # && \
    # pip3 install numpy matplotlib cycler

# 更新源
RUN apt install -y \
    gcc-5 \
    g++-5 \
    build-essential

# 设置默认编译器
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 50

WORKDIR /root