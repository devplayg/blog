---
title: 'Handling timezone in Spring Boot'
date: 2019-08-28T13:00:00+09:00
type: posts
categories:
    - programming language
tags:
    - timezone
    - Spring Boot
---

```java
LocalDateTime.now();                                 // 2020-03-02T06:48:56.623993
ZonedDateTime.now();                                 // 2020-03-02T06:48:56.616338Z[Etc/UTC]

ZonedDateTime.now().withZoneSameInstant(memberZone); // 2020-03-02T15:48:56.619674+09:00[Asia/Seoul]
ZonedDateTime.now(memberZone);                       // 2020-03-02T15:48:56.622355+09:00[Asia/Seoul]
LocalDateTime.now(memberZone);                       // 2020-03-02T15:48:56.625316
```

* LocalDateTime: Time based on systemt timezone
* ZonedDateTime: Time based on system or user-defined timezone


<img src="timezone.png">

JPA를 사용하다 보니, 시간변환에 대한 정리가 필요하여 작성했다.
