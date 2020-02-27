---
title: 'Mariadb tips'
date: 2019-06-08T15:13:27+09:00
lastmod: 2019-06-08T15:13:27+09:00
categories: 
  - database
  - tips
tags: 
  - profiling
  - mariadb
type: posts
---

### Profiling

```sql
SET GLOBAL general_log='ON'; 
SET GLOBAL slow_query_log='ON'; 
SET GLOBAL log_output='TABLE'; 

SELECT * FROM mysql.general_log;
truncate table mysql.general_log; 
```

### Change date to today

```sql
update table_name set date = DATE_ADD(date, INTERVAL DATEDIFF(NOW(), date) DAY);
```

### Add account

```sql
create user 'root'@'%' identified by 'YOURPASSWORD';
grant all privileges on *.* to 'root'@'%';
flush privileges;
```

### Change password

```sql
alter user 'root'@'%' identified by 'NEWPASSWORD';
flush privileges;
```

### Installation MariaDB on Ubuntu 18.04

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


Creating user

    $ mysql -u root
    create user 'devplayg'@'%' identified by 'devplayg12!@';
    grant all privileges on smartfactory.* to 'devplayg'@'%';
    grant all privileges on facex.* to 'devplayg'@'%';
    create user 'devplayg'@'localhost' identified by 'devplayg12!@';
    grant all privileges on smartfactory.* to 'devplayg'@'localhost';
    grant all privileges on facex.* to 'devplayg'@'localhost';
    flush privileges;
