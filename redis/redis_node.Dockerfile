FROM redis:latest
RUN apt-get update && apt-get install -y redis-tools netcat-traditional

COPY redis.conf /usr/local/etc/redis/redis.conf

ENV REDIS_PORT 6379
ENV REDIS_COM_PORT 16379

EXPOSE ${REDIS_PORT}
EXPOSE ${REDIS_COM_PORT}

VOLUME [ "/data" ]
WORKDIR /data

COPY "start_node.sh" "/start_node.sh"
RUN chmod +x /start_node.sh

CMD [ "/start_node.sh" ]
