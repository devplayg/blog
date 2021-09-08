---
title: Java time
---

```kotlin
val t = LocalDateTime.now()
t.format(DateTimeFormatter.BASIC_ISO_DATE)        // 20210908
t.format(DateTimeFormatter.ISO_DATE)              // 2021-09-08
t.format(DateTimeFormatter.ISO_DATE_TIME)         // 2021-09-08T09:59:17.6537137
t.format(DateTimeFormatter.ISO_LOCAL_DATE)        // 2021-09-08
t.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)   // 2021-09-08T09:59:17.6537137
t.format(DateTimeFormatter.ISO_LOCAL_TIME)        // 09:59:17.6537137
t.format(DateTimeFormatter.ISO_ORDINAL_DATE)      // 2021-251
t.format(DateTimeFormatter.ISO_TIME)              // 09:59:17.6537137
t.format(DateTimeFormatter.ISO_WEEK_DATE)         // 2021-W36-3
```
