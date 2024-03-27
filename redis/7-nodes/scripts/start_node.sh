rm -rf /data/${REDIS_PORT}
mkdir /data/${REDIS_PORT}
redis-server /usr/local/etc/redis/redis.conf --port ${REDIS_PORT} --cluster-enabled yes --dir /data/${REDIS_PORT}
