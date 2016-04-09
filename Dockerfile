FROM jefby/centos-arm64
ADD redis /root/redis
EXPOSE 6379
CMD /root/redis/redis-server /root/redis/redis.conf
