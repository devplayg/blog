---
title: 'Spring Boot 배포'
draft: true
---

gradlew bootjar

java -jar server-1.0.jar

java -Dspring.profiles.active=server -jar myApp.jar
