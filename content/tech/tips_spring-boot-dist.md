---
title: 'Sprint Boot tips'
type: posts
date: 2019-07-25T00:00:00+09:00
categories: 
  - programming language
  - java
  - spring framework
  - spring boot
  - tips
  - command-line
tags: 
  - Spring Boot
  - Java
---

### Building

    gradlew bootjar
    
### Running

Normal

    java -jar client.jar

Profile: dev

    java -Dspring.profiles.active=dev -jar client.jar

### Systemd script

```ini
[Unit]
Description=My client
After=syslog.target network.target mysql.service

[Service]
Type=simple
User=devplayg
Group=devplayg
WorkingDirectory=/home/devplayg/client
ExecStart=/usr/local/jdk/bin/java -Xms128m -Xmx256m -jar smartfactory.jar
SuccessExitStatus=143
Restart=on-failure
RestartSec=60

[Install]
WantedBy=multi-user.target
Alias=smartfactory.service
```
