---
title: 'Docker tips'
type: posts
date: 2019-06-07T00:28:15+09:00
lastmod: 2019-06-19T09:43:15+09:00
categories: 
  - os virtualization
  - tips
tags: 
  - docker
  - container
  - virtual machine
---

### Create docker container

    docker run -v e:/gohome:/gohome -it --name test ubuntu bash
    docker run -p 8000:8000 -v e:/gohome:/gohome -it --name test ubuntu bash

### Update Ubuntu-Lnux repository

    sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
    apt update && apt install -y vim net-tools inetutils-ping telnet curl git
    
### Install Go

    curl https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz | tar xvfz - -C /

### Set profile

```bash
$ vi ~/.profile && . ~/.profile
alias .pro="vi ~/.profile"
alias pro=". ~/.profile"
export GOROOT=/go
export GOPATH=/gohome
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export GO111MODULE=on
```
    
### Runs in Docker

Ubuntu

    docker run -p 8000:8000 -v e:/gohome:/gohome -it --name test ubuntu bash

Apache 2.4

    docker run -dit --name web -p 8080:80 -v E:/webhome/:/usr/local/apache2/htdocs/ httpd:2.4

MariaDB 10.3

    docker run --name db -e MYSQL_ROOT_PASSWORD=devplayg12!@ -p 3306:3306 -d mariadb:10.3
    docker exec -it db mysql -u root -p

	> select host, user, password from mysql.user;
    > create user 'root'@'%' identified by 'devplayg12!@';
    > flush privileges;
