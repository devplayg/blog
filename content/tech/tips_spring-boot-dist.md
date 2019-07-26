---
title: 'Sprint Boot tips'
type: posts
date: 2019-07-25T00:00:00+09:00
categories: 
  - programming language
  - java
  - spring boot
  - tips
tags: 
  - tips
  - Spring Boot
  - Java
---

# Build

    gradlew bootjar
    
# Run jar
    
    java -jar server-1.0.jar
    java -Dspring.profiles.active=server -jar myApp.jar
