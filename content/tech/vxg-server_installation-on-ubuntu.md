---
title: 'Ubuntu 18.04, VXG Video Server 설치'
type: posts
date: 2019-08-10T15:13:27+09:00
category:
    - installation
    - docker
    - VXG
tags:
    - vxg
    - vxg server
---

### 설치 버전

* Ubuntu: 18.04 LTS
* VXG Server: 1.3.293 (2019-July-04)


### 영상이 저장될 디렉토리 생성

    sudo mkdir -p /vxg/storage
    sudo mkdir -p /vxg/certificate
    sudo chown 755 -R /vxg
    sudo chown $USER:$USER -R /vxg

### VXG Server 다운로드

https://dashboard.videoexpertsgroup.com/?downloads=

    wget "https://dashboard.videoexpertsgroup.com/download/?file=827A8F35-C233-3C56-47C5-81A511B57A72" -O vxg_server.zip
    unzip vxg_server.zip -d /vxg
    ln -s /vxg/VXG.Server-1.3.293_190704/ /vxg/server


### HTTPS 인증서 생성

    cd /vxg/certificate
    openssl genrsa -out private.key 2048
    openssl req -new -key private.key -out certificate.csr -subj "/C=KR/ST=Seoul/L=Pangyo/O=devplayg/OU=playground/CN=devplayg.com"
    openssl x509 -req -days 3650 -extensions v3_ca -set_serial 1 -in certificate.csr -signkey private.key -out certificate.crt
    openssl x509 -text -in certificate.crt
    
### Docker 설치

    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    apt-cache policy docker-ce
    sudo apt install docker-ce
    sudo systemctl status docker
    sudo usermod -aG docker $USER
    
### VXG Server 설치

    cd /vxg/server/
    sudo ./setup.sh

### VXG Server와 MinIO(Storage) 이미지 확인

    $ docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    vxg_server          1.3.293.20190704    848e6e06e564        5 weeks ago         1.35GB
    minio/minio         latest              394f43bddae2        3 months ago        61MB

### VXG 영상 디렉토리 설정 변경

    $ vi start.sh
    59     docker run -d -p $PORT_MINIO:9000 --rm --network vxg-server-net \
    60         -e MINIO_ACCESS_KEY=$MINIO_ACCESS_KEY \
    61         -e MINIO_SECRET_KEY=$MINIO_SECRET_KEY \
    62         -v /data:/data --name vxg-server-storage \
    63         minio/minio:$MINIO_VERSION server /data

### VXG Server 시작

    sudo ./start.sh -h 0.0.0.0 -c /vxg/certificate -r


### VXG Server 임시 라이선스 발급

    https://xxx.xxx.xxx.xxx 웹사이트 접속 후 로그인 (admin / admin)

    [License] 메뉴에서 발급 (내용 생략)


### MinIO(VXG-Storage) 설치

MinIO 설치

    CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS                      PORTS     NAMES
    c946c7e9543e        vxg_server:1.3.293.20190704   "/bin/sh -c /opt/sky…"   10 hours ago        Up 10 hours                 (생략)   vxg_server

VXG Server의 Docker network 설정 확인

    $ docker inspect vxg_server | grep NetworkMode
    "NetworkMode": "vxg-server-net",

MinIO 설치 (Access key와 Secret key 는 Web의 [Settings - Storage] 에서 사용)

    $ sudo docker run -p 9000:9000 --name vxg-server-storage --net vxg-server-net -e "MINIO_ACCESS_KEY=dev" -e "MINIO_SECRET_KEY=devsecret" -v /vxg/storage:/data minio/minio  server /data
    $ sudo docker ps -a

    CONTAINER ID        IMAGE                         COMMAND                  CREATED              STATUS                            PORTS
    c1c70efd2b74        minio/minio                   "/usr/bin/docker-ent…"   About a minute ago   Up 5 seconds (health: starting)   0.0.0.0:9000->9000/tcp        vxg-server-storage
    de77848c85dd        vxg_server:1.3.293.20190704   "/bin/sh -c /opt/sky…"   21 minutes ago       Up 21 minutes                     0.0.0.0:80->80/tcp, .(생략)   vxg_server


### MinIO 접속

http://127.0.0.1:9000

ID: ###ACCESS-KEY### / PW: ###SECRET-KEY###
          
### 테스트 코드

    docker stop vxg_server && docker rm vxg_server
    docker stop vxg-server-storage && docker rm vxg-server-storage
