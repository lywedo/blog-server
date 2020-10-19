#!/bin/sh
docker stop my.db
docker rm my.db
docker rmi db/lam
sudo docker build -t db/lam .
docker run -it -e MYSQL_ROOT_PASSWORD=123456 -p 13387:3306 -v /root/lam/work:/root/work --name my.db -d db/lam
echo 'finish'
