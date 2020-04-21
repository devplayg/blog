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

## Installation

### SET UP THE REPOSITORY

```
sudo apt-get update
```

```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

### INSTALL DOCKER ENGINE

```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

```
sudo usermod -aG docker $USER
```

### Install Compose on Linux systems

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### Test

    sudo docker run hello-world

    docker info
    docker logs [name]
    docker exec -it [name] bash 
