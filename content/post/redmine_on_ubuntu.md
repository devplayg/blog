---
title: "Ubuntu 16.04 에 Redmine 3.4 설치"
date: 2019-01-19T21:36:24+09:00
draft: false
---

### 환경
* Ubuntu 16.04.5 LTS
* Ruby 2.5.1


### root 사용자로 로그인
```
# su -
```

### 필수 라이브러리 설치
```
# apt-get install git-core subversion imagemagick libmagickwand-dev libcurl4-openssl-dev 
```

### 데이터베이스 설치
```
# apt-get install mysql-server libmysqlclient-dev
```

##### 데이터베이스 설정
```
# mysql -u root -p
```
```
CREATE DATABASE redmine character SET utf8;
CREATE user 'redmine'@'localhost' IDENTIFIED BY 'redmine';
GRANT ALL privileges ON redmine.* TO 'redmine'@'localhost';
flush privileges;
quit;
```

### RVM(Ruby Version Manager) 설치
```
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# curl -sSL https://get.rvm.io | bash -s stable --ruby=2.5.1
```

#####  RVM(Ruby Version Manager) 설정
```
# echo '[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"' >> ~/.bashrc
# source /usr/local/rvm/scripts/rvm
```

### Phusion Passenger and Nginx 설치
```
# gem install passenger --no-ri --no-rdoc
# passenger-install-nginx-module
```

##### 선택 옵션
- [X]  1. This installer will compile and install Nginx with Passenger support.
- [X] Ruby
- [X] 1. Yes: download, compile and install Nginx for me. (recommended)
- [X] Please specify a prefix directory [/opt/nginx]: **[엔터]**

##### nginx 설정
```
# curl https://raw.githubusercontent.com/makevoid/nginx-passenger-ubuntu/master/nginx/nginx.service > /lib/systemd/system/nginx.service
# systemctl daemon-reload
# systemctl enable nginx
# cp /opt/nginx/conf/nginx.conf /opt/nginx/conf/nginx.conf_origin
# vi /opt/nginx/conf/nginx.conf
```

######## /opt/nginx/conf/nginx.conf 파일 내용 중, "http" 안의 "server" 섹션 전체를 아래 내용으로 교체
```
server {
  listen  80;  
  root /var/data/redmine/public;
  passenger_enabled on;
  client_max_body_size      10m; # Max attachemnt size
}
```

### SSL 키 설정
```
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```

##### SSL 키 정보 설정

```
Country Name (2 letter code) [AU]:                                
State or Province Name (full name) [Some-State]:                  
Locality Name (eg, city) []:                                      
Organization Name (eg, company) [Internet Widgits Pty Ltd]:       
Organizational Unit Name (eg, section) []:                        
Common Name (e.g. server FQDN or YOUR name) []: 192.168.100.139
Email Address []:                                                 
```

### Redmine 설치
```
# mkdir /var/data
# cd /var/data/
# svn export http://svn.redmine.org/redmine/branches/3.4-stable redmine
# cd /var/data/redmine
```

##### Redmine 데이터베이스 설정
```
# vi config/database.yml
```
```
production:
  adapter: mysql2
  database: redmine
  host: localhost
  username: redmine
  password: redmine
  encoding: utf8

development:
  adapter: mysql2
  database: redmine 
  host: localhost
  username: redmine
  password: redmine
  encoding: utf8
```

##### Redmine 플러그인 설치
```
# cd /var/data/redmine
# gem install bundler --no-ri --no-rdoc
# bundle install
```

##### Redmine 설정
```
# cd /var/data/redmine
# mkdir -p public/plugin_assets
# chown -R www-data:www-data files log tmp public/plugin_assets config.ru
# chmod -R 755 files log tmp public/plugin_assets
```

##### Migrate database
```
# cd /var/data/redmine
# bundle exec rake db:migrate
# bundle exec rake redmine:plugins
```

##### Generate session store
```
# bundle exec rake generate_secret_token 
```

### nginx 재시작
```
# systemctl restart nginx
```

### Redmine 접속
```
http://localhost
```

