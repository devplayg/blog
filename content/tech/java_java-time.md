---
title: Java time
---

```kotlin
val ldt = LocalDateTime.parse("2006-01-02 15:04:05", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
ldt.toString()                                                                2006-01-02T15:04:05
ldt.format(DateTimeFormatter.BASIC_ISO_DATE)                                  20060102
ldt.format(DateTimeFormatter.ISO_DATE)                                        2006-01-02
ldt.format(DateTimeFormatter.ISO_DATE_TIME)                                   2006-01-02T15:04:05
ldt.format(DateTimeFormatter.ISO_LOCAL_DATE)                                  2006-01-02
ldt.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)                             2006-01-02T15:04:05
ldt.format(DateTimeFormatter.ISO_LOCAL_TIME)                                  15:04:05
ldt.format(DateTimeFormatter.ISO_ORDINAL_DATE)                                2006-002
ldt.format(DateTimeFormatter.ISO_TIME)                                        15:04:05
ldt.format(DateTimeFormatter.ISO_WEEK_DATE)                                   2006-W01-1
ldt.toLocalDate().atStartOfDay().format(DateTimeFormatter.ISO_DATE_TIME)      2006-01-02T00:00:00
ldt.toLocalDate().atStartOfDay().plusSeconds(86400 - 1)
        .format(DateTimeFormatter.ISO_DATE_TIME)                              2006-01-02T23:59:59

val odt = OffsetDateTime.parse("2006-01-02T15:04:05+09:00")
odt.toString()                                                                2006-01-02T15:04:05+09:00
odt.format(DateTimeFormatter.ISO_INSTANT)                                     2006-01-02T06:04:05Z
odt.format(DateTimeFormatter.ISO_OFFSET_DATE)                                 2006-01-02+09:00
odt.format(DateTimeFormatter.ISO_OFFSET_DATE_TIME)                            2006-01-02T15:04:05+09:00
odt.format(DateTimeFormatter.ISO_OFFSET_TIME)                                 15:04:05+09:00
odt.format(DateTimeFormatter.ISO_ZONED_DATE_TIME)                             2006-01-02T15:04:05+09:00
odt.format(DateTimeFormatter.RFC_1123_DATE_TIME)                              Mon, 2 Jan 2006 15:04:05 +0900
```
