FROM "mcr.microsoft.com/devcontainers/base:bullseye"
RUN apt update && apt upgrade

#install java
RUN apt install -y default-jre default-jdk maven

#install python
RUN apt install -y python python3-pip

# install YCSB
ENV YCSB_VERSION 0.17.0
