---
title: Creating MariaDB Container
date: 2019-11-04T09:00:00+09:00
type: posts
categories:
    - database
    - docker
tags:
    - mariadb
    - docker
    - yaml
    - timezone
    - container
    - mysql
---

https://hub.docker.com/_/mariadb

### Write "docker-compose.yaml" file

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

### Create the container

    docker-compose up -d

### Set timezone

```
cat << "EOF" | sudo tee /data/mariadb/conf.d/my.cnf
[mysqld]
default-time-zone='+09:00'
EOF
```


### Chech if the container is running

    docker ps -a
    ---
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
    18b96300f58e        mariadb:10.3        "docker-entrypoint.s…"   10 minutes ago      Up 10 minutes       0.0.0.0:3306->3306/tcp   db

### Connect to the container and DB

    docker exec -it db bash
    mysql

### Search the DB users 

```sql
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
```

### Create the DB user

```sql
create user 'root'@'%' identified by 'Uniiot12!@';
grant all privileges on *.* to 'root'@'%';
flush privileges;
exit
```

### Exit container

    exit

### Restart the DB container

    docker restart db
