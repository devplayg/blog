---
title: Tips for Docker Compose
type: posts
date: 2022-01-29T00:28:15+09:00
series:
- Docker
categories:
- tips
- docker
- docker-composed
tags:
- docker
- docker-compose
- redis
- redis-cluster
- ldap
- mysql
---

Builds, (re)creates, starts, and attaches to containers for a service.

    docker-compose up -d


Stops containers and removes containers, networks, volumes, and images created by up.

    sudo docker-compose down


Remove containers for services not defined in the Compose file

    sudo docker-compose down --remove-orphans


`docker-compose.yaml`

```yaml
version: "3.1"

services:
    db:
        image: mysql:5.7.24
        container_name: db
        volumes:
            - ./db/data:/var/lib/mysql
            - ./db/conf.d:/etc/mysql/conf.d
        environment:
            - MYSQL_ROOT_PASSWORD=pa$$w0rd
            - MYSQL_DATABASE=devdb
            - MYSQL_USER=devplayg
            - MYSQL_PASSWORD=userpa$$w0rd
            - LANG=C.UTF-8
            - TZ=Asia/Seoul
        restart: unless-stopped
        ports:
            - "127.0.0.1:3306:3306"
        command: ['mysqld', '--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci']

    redis-cluster:
        image: grokzen/redis-cluster:6.0.12
        container_name: redis-c
        restart: unless-stopped
        ports:
            - 127.0.0.1:7000-7005:7000-7005

    redis:
        image: redis:6.0.12
        container_name: redis
        restart: unless-stopped
        ports:
            - "127.0.0.1:6379:6379"
        volumes:
            - ./redis/redis-data:/var/lib/redis
            - ./redis/redis.conf:/usr/local/etc/redis/redis.conf
        command: ['redis-server', '/usr/local/etc/redis/redis.conf']

    ldap:
        image: osixia/openldap:1.4.0
        container_name: ldap
        ports:
            - 127.0.0.1:389:389
        environment:
            - LDAP_ORGANISATION=Developer Playground
            - LDAP_DOMAIN="devplayg.com"
            - LDAP_ADMIN_PASSWORD=pa$$w0rd

```


`docker-compose.yaml` with network

```yaml
services:
  db:
    image: mysql:5.7.24
    container_name: db
    volumes:
      - ./db/data:/var/lib/mysql
      - ./db/conf.d:/etc/mysql/conf.d
    environment:
      - MYSQL_ROOT_PASSWORD=pa$$w0rd
      - MYSQL_DATABASE=devdb
      - MYSQL_USER=devplayg
      - MYSQL_PASSWORD=userpa$$w0rd
      - LANG=C.UTF-8
      - TZ=Asia/Seoul
    restart: unless-stopped
    ports:
      - "127.0.0.1:3306:3306"
    networks:
      - mynet
    command: ['mysqld', '--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci']

  redis-cluster:
    image: grokzen/redis-cluster:6.0.12
    container_name: redis-c
    restart: unless-stopped
    ports:
      - 127.0.0.1:7000-7005:7000-7005
    networks:
      - mynet
  redis:
    image: redis:6.0.12
    container_name: redis
    restart: unless-stopped
    ports:
      - "127.0.0.1:6379:6379"
    volumes:
      - ./redis/redis-data:/var/lib/redis
      - ./redis/redis.conf:/usr/local/etc/redis/redis.conf
    command: ['redis-server', '/usr/local/etc/redis/redis.conf']
    networks:
      - mynet

  ldap:
    image: osixia/openldap:1.4.0
    container_name: ldap
    ports:
      - 127.0.0.1:389:389
    environment:
      - LDAP_ORGANISATION=Developer Playground
      - LDAP_DOMAIN="devplayg.com"
      - LDAP_ADMIN_PASSWORD=pa$$w0rd
    networks:
      - mynet

networks:
  mynet:
```