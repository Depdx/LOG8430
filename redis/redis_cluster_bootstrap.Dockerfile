FROM ubuntu:latest
RUN apt-get update && apt-get install -y redis-tools netcat-traditional iputils-ping

ENV REDIS_NODE_0_PORT 7000
ENV REDIS_NODE_1_PORT 7001
ENV REDIS_NODE_2_PORT 7002

COPY "bootstrap_cluster.sh" "/bootstrap_cluster.sh"
RUN chmod +x /bootstrap_cluster.sh

CMD [ "/bootstrap_cluster.sh" ]
