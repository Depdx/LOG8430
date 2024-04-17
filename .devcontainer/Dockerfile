FROM "mcr.microsoft.com/devcontainers/base:bullseye"
RUN apt update && apt upgrade

RUN apt install -y \
    git \
    default-jre \
    default-jdk \
    maven \
    python \
    python3-pip \
    netcat-traditional \
    dos2unix

ENV YCSB_VERSION 0.17.0
