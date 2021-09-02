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
    
### Listing dependencies

    gradlew :hippo-api:dependencies --configuration compileClasspath
    
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


### LDAP

Spring boot + Security + LDAP
    
    javax.naming.ServiceUnavailableException
    Since there are 10 seconds between the role search and the error, this may be a timeout from the LDAP server.
    The search may be too slow… 
    
    -Dcom.sun.jndi.ldap.connect.pool.timeout=300000
