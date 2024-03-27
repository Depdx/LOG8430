rm -rf /data/${REDIS_PORT}
mkdir /data/${REDIS_PORT}
redis-server --port ${REDIS_PORT} --dir /data/${REDIS_PORT}
