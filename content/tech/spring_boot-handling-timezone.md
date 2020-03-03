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

`LocalDateTime` vs `ZonedDateTime`

* LocalDateTime: Time based on system timezone
* ZonedDateTime: Time based on system or user-defined timezone

```java
LocalDateTime.now();                                 // 2020-03-02T06:48:56.623993
ZonedDateTime.now();                                 // 2020-03-02T06:48:56.616338Z[Etc/UTC]

ZonedDateTime.now().withZoneSameInstant(memberZone); // 2020-03-02T15:48:56.619674+09:00[Asia/Seoul]
ZonedDateTime.now(memberZone);                       // 2020-03-02T15:48:56.622355+09:00[Asia/Seoul]
LocalDateTime.now(memberZone);                       // 2020-03-02T15:48:56.625316
```

- memberZone = Asia/Seoul
- System = UTC


<img src="timezone.png">

