---
title: Java time
---

```kotlin
LocalDateTime.now().format(DateTimeFormatter.BASIC_ISO_DATE)        // 20210908
LocalDateTime.now().format(DateTimeFormatter.ISO_DATE)              // 2021-09-08
LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME)         // 2021-09-08T09:59:17.6537137
LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE)        // 2021-09-08
LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)   // 2021-09-08T09:59:17.6537137
LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_TIME)        // 09:59:17.6537137
LocalDateTime.now().format(DateTimeFormatter.ISO_ORDINAL_DATE)      // 2021-251
LocalDateTime.now().format(DateTimeFormatter.ISO_TIME)              // 09:59:17.6537137
LocalDateTime.now().format(DateTimeFormatter.ISO_WEEK_DATE)         // 2021-W36-3

OffsetDateTime.now().format(DateTimeFormatter.ISO_INSTANT)           // 2021-09-08T01:20:57.637528500Z   
OffsetDateTime.now().format(DateTimeFormatter.ISO_OFFSET_DATE)       // 2021-09-08+09:00                 
OffsetDateTime.now().format(DateTimeFormatter.ISO_OFFSET_DATE_TIME)  // 2021-09-08T10:20:57.6445277+09:00
OffsetDateTime.now().format(DateTimeFormatter.ISO_OFFSET_TIME)       // 10:20:57.6455284+09:00           
OffsetDateTime.now().format(DateTimeFormatter.ISO_ZONED_DATE_TIME)   // 2021-09-08T10:20:57.6465296+09:00
OffsetDateTime.now().format(DateTimeFormatter.RFC_1123_DATE_TIME)    // Wed, 8 Sep 2021 10:20:57 +0900   
```
