---
title: 'Ubuntu 18.04 tips'
date: 2019-08-19T00:00:00+09:00
type: posts
categories:
    - linux
    - tips
tags:
    - ubuntu
    - ubuntu 18.04
---

### Check network interfaces

```
ls /sys/class/net
---
eno1  eno2  lo
```

### Configuration Static IP

`/etc/netplan/01-netcfg.yaml`

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
    eno2:
      dhcp4: yes
``` 

Restart network

    sudo netplan apply
    
### Sudoers file, enable NOPASSWD for user, all commands

    sudo visudo -f /etc/sudoers.d/myOverrides 
    ---
    your_username  ALL=NOPASSWD: ALL


### UFW 

    $ sudo ufw allow OpenSSH
    $ sudo ufw enable
    $ sudo ufw allow 8808/tcp
    $ sudo ufw allow 50000:50100/tcp
    $ sudo ufw status verbose
    $ sudo ufw allow from 1.1.1.1 to any port 22 proto tcp


### Changing host name

    sudo hostnamectl set-hostname dpgserver
    sudo vi /etc/hosts    


## MPlayer

Install

	sudo apt install mplayer mplayer-fonts

Install GUI version

	sudo apt install smplayer
