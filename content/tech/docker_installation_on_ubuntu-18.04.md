---
title: 'Installation Docker on Ubuntu 18.04'
date: 2019-08-19T00:00:00+09:00
type: posts
draft: true
categories:
    - installation
    - docker
    - linux
tags:
    - docker
    - ubuntu 18.04
---
 
### 기존 Docker 삭제 (옵션)

     $ sudo apt-get remove docker docker-engine docker.io

### 필수 패키지 설치

    $ sudo apt-get update && sudo apt-get install \
            apt-transport-https \
            ca-certificates \
            curl \
            software-properties-common


### 패키지 저장소 추가

아래의 명령어를 사용하여 도커의 공식 GPG 키와 저장소를 추가해 주시기 바랍니다.

    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    $ sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

패키지 검색 확인

    $ sudo apt-get update && sudo apt-cache search docker-ce

### Docker CE 설치

    $ sudo apt-get update && sudo apt-get install docker-ce

### 사용자에게 Docker 관리권한 추가

    $ sudo usermod -aG docker $USER

### Docker 실행 확인

    $ sudo systemctl status docker