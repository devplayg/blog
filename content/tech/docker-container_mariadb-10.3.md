---
title: Installing and using MariaDB 10.3 via Docker 
type: posts
date: 2020-01-01T18:00:00+09:00
series:
    - Docker
categories: 
  - docker
  - tips
tags: 
  - docker
  - mariadb 10.3
  - mariadb
  - database
---

https://hub.docker.com/_/mariadb


## Pulling and run image from command-line

```
docker run --name db -e MYSQL_ROOT_PASSWORD=YOUR_PASSWORD -e TZ=Asia/Seoul -p 3306:3306 -d mariadb:10.3 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```

- **-e** MYSQL_ROOT_PASSWORD=YOUR_PASSWORD 
- **-e** TZ=Asia/Seoul 
- **-p** 3306:3306 
- **-d** mariadb:10.3
- --character-set-server=utf8mb4
- --collation-server=utf8mb4_unicode_ci

## Pulling and run image from docker-composer

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
      - MYSQL_ROOT_PASSWORD=root12!@
      - MYSQL_DATABASE=devplayg
      - MYSQL_USER=devplayg
      - MYSQL_PASSWORD=devplayg12!@
      - TZ=Asia/Seoul
    restart: unless-stopped
    ports:
      - "3306:3306"
    command: ['mysqld', '--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci']
```

run

```
docker-compose up -d
```

connecting to database as "root"

```
docker exec -it db mysql -u root -p
```

- password: root12!@


- check user

```sql
select host, user, password from mysql.user;
```

- add another user

```sql
create user 'whattup'@'%' identified by 'whattup12!@';
grant all privileges on devplayg.* to 'whattup'@'%';
flush privileges;
```