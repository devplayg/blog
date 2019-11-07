---
title: ' Ubuntu 18.04에서 Java jar를 Service로 실행하기'
type: posts
categories:
    - linux
    - systemd
    - service
tags:
  - ubuntu 18.04
  - systemd
  - service
  - jar
  - java
---

### Step1. 서비스 파일 생성

    sudo vi /etc/systemd/system/smartfactory.service

smartfactory.service

```
[Unit]
Description=Smart Factory client
After=syslog.target network.target mysql.service

[Service]
Type=simple
User=devplayg
Group=devplayg
WorkingDirectory=/home/devplayg/client
ExecStart=/usr/local/jdk/bin/java -Xms128m -Xmx256m -jar smartfactory.jar
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
Alias=smartfactory.service
```

443포트나 80포트를 사용하려면, User와 Group 값을 "root"로 변경한다.

### 서비스 파일, 실행권한 변경

    chmod 644 smartfactory.service

### Systemd 데몬 재시작

    sudo systemctl daemon-reload

### 서비스 시작  

    sudo systemctl start smartfactory.service
