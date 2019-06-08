---
title: 'Docker Tips'
date: 2019-06-07T00:28:15+09:00
lastmod: 2019-06-07T00:28:15+09:00
categories: 
    - tech
tags: 
    - docker
    - tips
type: posts
---

### Create docker container

    docker run -v e:/gohome:/gohome -it --name test ubuntu bash
    
    docker run -p 8000:8000 -v e:/gohome:/gohome -it --name test ubuntu bash

### Repository update

    sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
    apt update && apt install -y vim net-tools inetutils-ping telnet curl
    
### Installing Go

    curl https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz | tar xvfz - -C /


### Set profile

    vi ~/.profile && . ~/.profile
    ---
    alias .pro="vi ~/.profile"
    alias pro=". ~/.profile"
    export GOROOT=/go
    export GOPATH=/gohome
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH