#!/bin/sh
docker stop my.minio
docker rm my.minio
docker rmi minio/lam
sudo docker build -t minio/lam .
echo 'build finish'
docker run -it -e MINIO_ACCESS_KEY=minio -e MINIO_SECRET_KEY=minio123 -p 9000:9000 -v /root/lam/work/minio/data:/data -v /root/lam/work/minio/config:/root/.minio --name my.minio -d minio/lam
echo 'finish'
