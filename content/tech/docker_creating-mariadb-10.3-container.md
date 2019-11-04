---
title: Creating Docker container - MariaDB
date: 2019-11-04T09:00:00+09:00
type: posts
categories:
    - docker
tags:
    - mariadb
    - docker
    - yaml
    - timezone
    - container
    - mysql
---


docker-compose.yaml

```yaml
version: '3'

services:
  db:
    image: mariadb:10.3
    container_name: db
    volumes:
      - /data/mariadb/datadir:/var/lib/mysql
      - /data/mariadb/conf.d:/etc/mysql/conf.d
    environment:
      - MYSQL_ROOT_PASSWORD=Uniiot12!@
    restart: unless-stopped
    ports:
      - "3306:3306"
    command: ['mysqld', '--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci']
```

Container 생성

    docker-compose up -d

시간대 설정

    cat << "EOF" | sudo tee /data/mariadb/conf.d/my.cnf
    [mysqld]
    default-time-zone='+00:00'
    EOF


Container 확인

    docker ps -a
    ---
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
    18b96300f58e        mariadb:10.3        "docker-entrypoint.s…"   10 minutes ago      Up 10 minutes       0.0.0.0:3306->3306/tcp   db

Container 에 접속

    docker exec -it db bash
    mysql

DB 사용자 조회

    select host, user, password from mysql.user;
    ---
    +--------------+------+----------+
    | host         | user | password |
    +--------------+------+----------+
    | localhost    | root |          |
    | 68452e036ab4 | root |          |
    | 127.0.0.1    | root |          |
    | ::1          | root |          |
    | localhost    |      |          |
    | 68452e036ab4 |      |          |
    +--------------+------+----------+

사용자 생성

    create user 'root'@'%' identified by 'Uniiot12!@';
    grant all privileges on *.* to 'root'@'%';
    flush privileges;
    exit

Container 탈출

    exit

"db" Container 재시작

    docker restart db
