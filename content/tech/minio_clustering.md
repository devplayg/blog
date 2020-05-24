---
title: MinIO 클러스터링 with Docker
date: 2020-05-24T09:00:01+09:00
type: posts
categories:
    - storage
tags:
    - minio
    - docker
---

## 환경 구성

### Docker 네트워크 생성

    docker network create minio-network

### 멀티 MinIO 컨테이너 설정 및 시작

포트는 9001~9004;

    docker run -p 9001:9000 --name minio1 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v /storage/data1:/data minio/minio server http://minio{1...4}/data
    docker run -p 9002:9000 --name minio2 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v /storage/data2:/data minio/minio server http://minio{1...4}/data
    docker run -p 9003:9000 --name minio3 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v /storage/data3:/data minio/minio server http://minio{1...4}/data
    docker run -p 9004:9000 --name minio4 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v /storage/data4:/data minio/minio server http://minio{1...4}/data

### 공통 Bucket 생성

4개 컨테이너 중, 임의의 컨테이너에 접속 후 Bucket 생성

ex) http://127.0.01:9001


## 복구 테스트

### 파일 삭제

임의의 컨테이너를 중지 후, 로컬호스트와 연결된 디스크에서 파일 삭제

    docker stop minio4
    docker rm minio4
    rm -rf data

### 파일 복구

임의의 컨테이너 시작

    docker run -p 9004:9000 --name minio4 --network minio-network -e "MINIO_ACCESS_KEY=devplayg" -e "MINIO_SECRET_KEY=devplayg12!@" -v /storage/data4:/data minio/minio server http://minio{1...4}/data

나머지 컨테이너 중 1개에 접속하여, MinIO Client 설치

    docker exec -it minio2 /bin/sh
    wget https://dl.min.io/client/mc/release/linux-amd64/mc
    chmod +x mc
    
복구

./mc config host add minio4 http://minio4:9000 devplayg devplayg12!@
./mc admin heal -r minio4/
