---
title: Installing and using Ubuntu 18.04 via Docker 
type: posts
date: 2020-01-01T18:00:00+09:00
series:
    - Docker
categories: 
  - docker
  - tips
tags: 
  - docker
  - ubuntu 18.04
  - ubuntu
  - linux
  - os
---

## Pulling and run image

in general

```
docker run -it --name ubt ubuntu:18.04 bash
```
    
with sharing filesystem

```     
docker run -it -v /host/dir:/container/dir --name ubt ubuntu:18.04 bash
```   
    
with binding container ports to the host

```        
docker run -p 8000:80 -it --name ubt ubuntu:18.04 bash
```

- 8000: Host port
- 80: Container port 


## *My favorite*
    
```
docker run -it -v e:/gohome:/gohome --name ubt ubuntu:18.04 bash
```

- change repository and update

```  
sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
apt update && apt install -y vim net-tools inetutils-ping telnet curl git
```

- install Go

```  
curl https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz | tar xvfz - -C /
```

- set profile

```bash
vi ~/.profile && . ~/.profile
```

    - ~/.profile

```bash
alias .pro="vi ~/.profile"
alias pro=". ~/.profile"
alias dev="cd /gohome/src/github.com/devplayg"
export GOROOT=/go
export GOPATH=/gohome
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
```
