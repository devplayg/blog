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

    $ vi /etc/netplan/01-netcfg.yaml
    ---
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
    $ sudo netplan apply
    
### Configuration UFW 

    $ sudo ufw allow OpenSSH
    $ sudo ufw enable
    $ sudo ufw allow 8808/tcp
    $ sudo ufw allow 50000:50100/tcp
    $ sudo ufw status verbose

### Installation MariaDB

https://downloads.mariadb.org/mariadb/repositories/#mirror=digitalocean-ams

Install the package

    $ sudo apt-get install software-properties-common
    $ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    $ sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://ftp.kaist.ac.kr/mariadb/repo/10.3/ubuntu bionic main'
    $ sudo apt update
    $ sudo apt install mariadb-server

Change the data directory

    $ sudo service mysql stop
    $ sudo vi /etc/mysql/my.cnf
        datadir 
    $ sudo vi /etc/mysql/mariadb.cnf
        skip-character-set-client-handshake
    $ sudo mysql_install_db --user=mysql --datadir=/data/mysql  --defaults-file=/etc/mysql/my.cnf
    $ sudo service mysql start


사용자 생성

    $ mysql -u root
    create user 'devplayg'@'%' identified by 'devplayg12!@';
    grant all privileges on smartfactory.* to 'devplayg'@'%';
    grant all privileges on facex.* to 'devplayg'@'%';
    create user 'devplayg'@'localhost' identified by 'devplayg12!@';
    grant all privileges on smartfactory.* to 'devplayg'@'localhost';
    grant all privileges on facex.* to 'devplayg'@'localhost';
    flush privileges;
    
### 호스트 이름 변경

    sudo hostnamectl set-hostname dpgserver
    sudo vi /etc/hosts    
