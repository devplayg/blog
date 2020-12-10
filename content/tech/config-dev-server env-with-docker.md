---
title: Using Docker0compose for local development environment
date: 2020-12-07T00:00:00+09:00
type: posts
categories:
  - docker
  - db
  - server
tags:
   - docker
   - docker-compose
   - ubuntu
   - redis
   - mariadb
---

### Create network

    docker network create -d bridge dev-net

### Build environment

`docker-compose.yaml`

```
networks:
  network1:
    name: dev-net

services:
  db:
    image: mariadb:10.3
    container_name: dev-db
    volumes:
      - /d/data/dev/mariadb/data:/var/lib/mysql
      - /d/data/dev/mariadb/conf.d:/etc/mysql/conf.d
    environment:
      - MYSQL_ROOT_PASSWORD=devplayg12!@
      - MYSQL_DATABASE=devplayg
      - MYSQL_USER=devplayg
      - MYSQL_PASSWORD=devplayg12!@
      - TZ=Asia/Seoul
    restart: unless-stopped
    networks:
     - network1
    ports:
      - "3306:3306"
    command: ['mysqld', '--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci']

  redis:
    image: redis:latest
    container_name: dev-redis
    volumes:
      - /d/data/dev/redis/redis-data:/var/lib/redis
      - /d/data/dev/redis/redis.conf:/usr/local/etc/redis/redis.conf
    ports:
      - "6379:6379"
    networks:
     - network1
    command: ['redis-server', '/usr/local/etc/redis/redis.conf']

  server:
    image: ubuntu:18.04
    container_name: dev-server
    volumes:
      - /e/gohome:/gohome
    networks:
     - network1
    tty: true
```
