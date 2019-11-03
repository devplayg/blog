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

    
## 1. Containers

### Ubuntu 18.04

    docker run -p 8000:8000 -v e:/gohome:/gohome -it --name test ubuntu bash

### Apache 2.4

    docker run -dit --name web -p 8080:80 -v E:/webhome/:/usr/local/apache2/htdocs/ httpd:2.4

### MariaDB 10.3

Commands

```bash
docker run --name db -e MYSQL_ROOT_PASSWORD=MY_PASSWORD -e TZ=Asia/Seoul -p 3306:3306 -d mariadb:10.3  --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
docker exec -it db mysql -u root
``` 

Queries

```sql
select host, user, password from mysql.user;
create user 'root'@'%' identified by 'MY_PASSWORD';
grant all privileges on *.* to 'root'@'%';
flush privileges;
```

### MariaDB 10.3 (docker-compose.yaml)

```yaml
version: '3'

services:
  db:
    image: mariadb:10.3
    container_name: db
    environment:
      - MYSQL_ROOT_PASSWORD=MY_PASSWORD
      - MYSQL_RANDOM_ROOT_PASSWORD=yes
      - MYSQL_DATABASE=MY_DATABASE
      - MYSQL_USER=devplayg
      - MYSQL_PASSWORD=MY_PASSWORD
    restart: always
    ports:
      - "3306:3306"
    command: ['mysqld', '--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci']
``` 

## 2. On Ubuntu

### Update Ubuntu-Linux repository

    sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
    apt update && apt install -y vim net-tools inetutils-ping telnet curl git
    
### Install Go

    curl https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz | tar xvfz - -C /

### Set profile in Ubuntu 18.04

```bash
vi ~/.profile && . ~/.profile
---
alias .pro="vi ~/.profile"
alias pro=". ~/.profile"
export GOROOT=/go
export GOPATH=/gohome
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export GO111MODULE=on
```


## 3. Docker Commands

    docker info
    docker logs [name]
    docker exec -it [name] bash 