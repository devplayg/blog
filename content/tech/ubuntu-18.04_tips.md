---
title: 'Ubuntu 18.04 tips'
date: 2019-08-19T00:00:00+09:00
type: posts
categories:
    - tips
    - linux
tags:
    - tips
    - linux
    - ubuntu
---

### Configure Static IP Addresses on Ubuntu 18.04 LTS Server

/etc/netplan/*.yaml

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eno1:
      addresses:
        - 192.168.0.207/24
      gateway4: 192.168.0.1
      nameservers:
          addresses: [168.126.63.1,8.8.8.8]
```