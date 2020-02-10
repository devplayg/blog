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
