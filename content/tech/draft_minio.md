---
title: MinIO Clustering
date: 2020-05-20T09:00:00+09:00
draft:true
---

### Create new docker network for distributed MinIO

    docker network create minio-network

###  Start 4 MinIO containers

    docker run -p 9001:9000 --name minio1 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v d:/storage/data1:/data minio/minio server http://minio{1...4}/data
    docker run -p 9002:9000 --name minio2 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v d:/storage/data2:/data minio/minio server http://minio{1...4}/data
    docker run -p 9003:9000 --name minio3 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v d:/storage/data3:/data minio/minio server http://minio{1...4}/data
    docker run -p 9004:9000 --name minio4 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v d:/storage/data4:/data minio/minio server http://minio{1...4}/data

###  Create a bucket

Choose one of Minio containers

http://127.0.01:9001


### Recovery test

Remove file

    docker stop minio4
    docker rm minio4
    rm -rf data

###  .

    docker run -p 9004:9000 --name minio4 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v d:/storage/data4:/data minio/minio server http://minio{1...4}/data

Connect to one of 1,2,3

    docker exec -it minio2 /bin/sh
    wget https://dl.min.io/client/mc/release/linux-amd64/mc
    chmod +x mc

./mc config host add minio4 http://minio4:9000 devplayg devplayg12!@
./mc admin heal -r minio4/


./mc config host add minio2 http://minio4:9000 devplayg devplayg12!@
./mc admin heal -r minio2/
