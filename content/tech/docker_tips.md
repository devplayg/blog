---
title: 'Docker tips'
type: posts
date: 2019-06-07T00:28:15+09:00
lastmod: 2019-06-19T09:43:15+09:00
categories: 
  - docker
  - tips
tags: 
  - docker
  - tips
  - virtual machine
  - container
---

### Create docker container

    docker run -v e:/gohome:/gohome -it --name test ubuntu bash
    docker run -p 8000:8000 -v e:/gohome:/gohome -it --name test ubuntu bash

### Update linux repository

    sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
    apt update && apt install -y vim net-tools inetutils-ping telnet curl git
    
### Install Go

    curl https://dl.google.com/go/go1.12.9.linux-amd64.tar.gz | tar xvfz - -C /

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

Apache 2.4

    docker run -dit --name web -p 8080:80 -v E:/webhome/:/usr/local/apache2/htdocs/ httpd:2.4
