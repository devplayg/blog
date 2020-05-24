---
title: Docker, Ubuntu 18.04에 설치하기
date: 2020-05-23T09:00:00+09:00
type: posts
series:
    - Docker
categories:
    - installation
    - docker
    - linux
tags:
    - docker
    - docker compose
    - ubuntu 18.04
---

https://docs.docker.com/engine/install/ubuntu/

## Docker 설치

apt 패키지 업데이트

```
$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

Docker GPG 키 추가

    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


저장소 업데이트

    $ sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    $ sudo apt-get update

Docker 설치

    $ sudo apt-get install docker-ce docker-ce-cli containerd.io

현재 사용자에게 Docker 실행권한 할당

    $ sudo usermod -aG docker $USER

Hello Docker

    $ sudo docker run hello-world

## Docker Compose 설치

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Docker 삭제

엔진만 삭제

     $ sudo apt-get purge docker-ce docker-ce-cli containerd.io
     
모두 삭제 (이미지, 컨터이너 포함 삭제) 

     $ sudo rm -rf /var/lib/docker

