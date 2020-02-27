---
title: Installing and using CentOS 6.10 via Docker 
type: posts
date: 2020-01-01T18:00:00+09:00
series:
    - Docker
categories: 
  - docker
tags: 
  - docker
  - centos
  - centos 6.10
  - linux
  - os
---

## Pulling and run image

in general

```
docker run -it --name cos centos:6.10 bash
```
    
with sharing filesystem

```     
docker run -it -v /host/dir:/container/dir --name cos centos:6.10 bash
```   

with binding container ports to the host

```        
docker run -p 8000:80 -it --name cos centos:6.10 bash
```

- 8000: Host port
- 80: Container port 


## *My favorite*
    
```
docker run -it -v e:/gohome:/gohome --name cos centos:6.10 bash
```

- change repository and update

```ini
echo '[base]
name=CentOS-$releasever - Base
baseurl=http://mirror.kakao.com/centos/$releasever/os/$basearch/
gpgcheck=0 
[updates]
name=CentOS-$releasever - Updates
baseurl=http://mirror.kakao.com/centos/$releasever/updates/$basearch/
gpgcheck=0
[extras]
name=CentOS-$releasever - Extras
baseurl=http://mirror.kakao.com/centos/$releasever/extras/$basearch/
gpgcheck=0' > /etc/yum.repos.d/kakao.repo
yum repolist
```

- install Go

```
curl https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz | tar xvfz - -C /
```

- set profile

```bash
vi ~/.bash_profile && . ~/.bash_profile
```

    - ~/.bash_profile

```bash
alias .pro="vi ~/.bash_profile"
alias pro=". ~/.bash_profile"
alias dev="cd /gohome/src/github.com/devplayg"
export GOROOT=/go
export GOPATH=/gohome
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
```
