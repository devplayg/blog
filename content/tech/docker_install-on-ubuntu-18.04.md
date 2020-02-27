---
title: 'Installation Docker on Ubuntu 18.04'
date: 2019-08-19T00:00:00+09:00
series:
    - Docker
type: posts
draft: true
categories:
    - installation
    - docker
    - linux
tags:
    - docker
    - ubuntu 18.04
---

https://docs.docker.com/install/linux/docker-ce/ubuntu/

## SET UP THE REPOSITORY
 
Update the apt package index:

    sudo apt-get update

Install packages to allow apt to use a repository over HTTPS:

    sudo apt-get install \
         apt-transport-https \
         ca-certificates \
         curl \
         gnupg-agent \
         software-properties-common

Add Docker’s official GPG key:

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
     

Set up repository
    
    sudo add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
         $(lsb_release -cs) \
         stable"
    
    
## INSTALL DOCKER ENGINE - COMMUNITY

Update the apt package index.

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

Add your user to the “docker” group

    sudo usermod -aG docker $USER

    
## Uninstall Docker Engine - Community

    sudo apt-get purge docker-ce
    sudo rm -rf /var/lib/docker