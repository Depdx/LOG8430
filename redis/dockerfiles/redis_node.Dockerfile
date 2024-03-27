FROM redis:latest
RUN apt-get update && apt-get install -y redis-tools netcat-traditional

COPY redis.conf /usr/local/etc/redis/redis.conf

ENV REDIS_PORT 6379
ENV REDIS_COM_PORT 16379

EXPOSE ${REDIS_PORT}
EXPOSE ${REDIS_COM_PORT}

VOLUME [ "/data" ]
VOLUME [ "/scripts" ]

WORKDIR /data
CMD [ "sh", "-c", "chmod +x /scripts/start_node.sh && /scripts/start_node.sh" ]
