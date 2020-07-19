---
title: 'Docker tips'
type: posts
date: 2019-06-07T00:28:15+09:00
lastmod: 2019-06-19T09:43:15+09:00
series:
    - Docker 
categories: 
  - tips
  - docker
tags: 
  - docker
---

### Commands
    
    docker info
    docker logs [name]
    docker exec -it [name] bash 

### My favorites on Windows

Ubuntu 18.04

    docker run -dit --name ubt -v e:/gohome:/gohome ubuntu:18.04 bash
    
Redis

    docker run -dit -p 6379:6379 --name redis -v e:/data/redis:/data redis
    
Apache HTTP

    docker run -dit -p 8080:80 --name web -v e:/webhome/:/usr/local/apache2/htdocs/ httpd:2.4
    
[MariaDB 10.3](https://devplayg.com/tech/docker-container_mariadb-10.3/)

