#!/bin/sh
docker stop my.redis
docker rm my.redis
docker rmi redis/lam
sudo docker build -t redis/lam .
#docker run -it -p 16379:6379 -v /root/lam/work:/root/work --name my.redis -d redis/lam
docker run -it -p 16379:6379 -v /root/lam/work:/root/work --name my.redis -d -e 'REDIS_PASSWORD=redispassword' redis/lam

echo 'finish'
