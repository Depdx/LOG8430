FROM ubuntu:latest
RUN apt-get update && apt-get install -y redis-tools netcat-traditional iputils-ping

ENV REDIS_NODE_0_PORT 7000
ENV REDIS_NODE_1_PORT 7001
ENV REDIS_NODE_2_PORT 7002
ENV REDIS_REPLICA_NODE_0_0_PORT 7003
ENV REDIS_REPLICA_NODE_1_0_PORT 7004
ENV REDIS_REPLICA_NODE_2_0_PORT 7005
ENV REDIS_REPLICA_NODE_0_1_PORT 7006
ENV REDIS_REPLICA_NODE_1_1_PORT 7007
ENV REDIS_REPLICA_NODE_2_1_PORT 7008

VOLUME [ "/scipts" ]

CMD [ "sh", "-c", "chmod +x /scripts/bootstrap_cluster.sh && /scripts/bootstrap_cluster.sh" ]
