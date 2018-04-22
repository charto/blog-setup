#!/bin/bash

docker kill -s TERM blog-nginx
docker kill -s TERM blog-nodebb
docker kill -s TERM blog-ghost
docker kill -s TERM blog-redis

sleep 5

docker stop blog-nginx
docker stop blog-nodebb
docker stop blog-ghost
docker stop blog-redis

sleep 2
# rm /opt/blog/redis/dump.rdb

docker rm blog-nginx
docker rm blog-nodebb
docker rm blog-ghost
docker rm blog-redis

docker network rm blog
docker network create blog

cd "$(dirname "${BASH_SOURCE[0]}")"
cd docker
# docker rmi blog-nginx
# docker rmi blog-node
# docker rmi blog-redis
# docker rmi blog-debian
docker build -t blog-debian debian
docker build -t blog-node node
docker build -t blog-redis redis
docker build -t blog-ghost ghost
docker build -t blog-nodebb nodebb
docker build -t blog-nginx nginx

echo never > /sys/kernel/mm/transparent_hugepage/enabled
# sysctl --system

docker run -d \
	-h blog-redis \
	--name blog-redis \
	--net blog \
	--restart always \
	--expose 6379 \
	-v /opt/blog:/opt/blog \
	blog-redis bash -c "redis-server /etc/redis/redis.conf --dir /opt/blog/redis --protected-mode no --bind 0.0.0.0 --daemonize no --logfile /dev/stdout"

docker run --privileged -d \
	-h blog-ghost \
	--name blog-ghost \
	--net blog \
	--restart always \
	--expose 2368 \
	-p 127.0.0.1:2368:2368 \
	-v /opt/blog:/opt/blog \
	blog-ghost bash -c "cd /opt/ghost && ghost setup migrate && NODE_ENV=production node current/index.js"

docker run --privileged -d \
	-h blog-nodebb \
	--name blog-nodebb \
	--net blog \
	--restart always \
	--expose 4567 \
	-p 127.0.0.1:4567:4567 \
	-v /opt/blog:/opt/blog \
	blog-nodebb bash -c "cd /opt/nodebb && defaultPlugins='["\
\	"\"nodebb-plugin-sso-google\","\
\	"\"nodebb-plugin-blog-comments\""\
\	"]' ./nodebb setup -c /opt/blog/nodebb/setup.json && ./nodebb start -l"

docker run -d \
	-h blog-nginx \
	--name blog-nginx \
	--net blog \
	--restart always \
	-p 127.0.0.1:443:443 \
	-p 80:80 \
	-v /opt/blog:/opt/blog \
	-v /opt/blog/nginx:/etc/nginx \
	-v /etc/letsencrypt:/etc/letsencrypt \
	blog-nginx bash -c "nginx -g 'daemon off;'"
