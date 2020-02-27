---
title: Installing and using other containers via Docker 
type: posts
date: 2020-01-01T18:00:00+09:00
series:
    - Docker
categories: 
  - docker
tags: 
  - docker
  - apache 2.4
  - web server
---


## Pulling and run image

Apache 2.4

```
docker run -dit --name web -p 8080:80 -v E:/webhome/:/usr/local/apache2/htdocs/ httpd:2.4
```
