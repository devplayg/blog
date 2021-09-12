---
title: Java time
---

### LocalDateTime

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
```


### OffsetDateTime

```
val odt = OffsetDateTime.parse("2006-01-02T15:04:05+09:00")
odt.toString()                                                                2006-01-02T15:04:05+09:00
odt.format(DateTimeFormatter.ISO_INSTANT)                                     2006-01-02T06:04:05Z
odt.format(DateTimeFormatter.ISO_OFFSET_DATE)                                 2006-01-02+09:00
odt.format(DateTimeFormatter.ISO_OFFSET_DATE_TIME)                            2006-01-02T15:04:05+09:00
odt.format(DateTimeFormatter.ISO_OFFSET_TIME)                                 15:04:05+09:00
odt.format(DateTimeFormatter.ISO_ZONED_DATE_TIME)                             2006-01-02T15:04:05+09:00
odt.format(DateTimeFormatter.RFC_1123_DATE_TIME)                              Mon, 2 Jan 2006 15:04:05 +0900
```


### java.text.SimpleDateFormat

https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html?is-external=true


| Letter | Date or Time Component                           | Presentation       | Examples                              |
|--------|--------------------------------------------------|--------------------|---------------------------------------|
| G      | Era designator                                   | Text               | AD                                    |
| y      | Year                                             | Year               | 1996; 96                              |
| Y      | Week year                                        | Year               | 2009; 09                              |
| M      | Month in year (context sensitive)                | Month              | July; Jul; 07                         |
| L      | Month in year (standalone form)                  | Month              | July; Jul; 07                         |
| w      | Week in year                                     | Number             | 27                                    |
| W      | Week in month                                    | Number             | 2                                     |
| D      | Day in year                                      | Number             | 189                                   |
| d      | Day in month                                     | Number             | 10                                    |
| F      | Day of week in month                             | Number             | 2                                     |
| E      | Day name in week                                 | Text               | Tuesday; Tue                          |
| u      | Day number of week (1 = Monday, ..., 7 = Sunday) | Number             | 1                                     |
| a      | Am/pm marker                                     | Text               | PM                                    |
| H      | Hour in day (0-23)                               | Number             | 0                                     |
| k      | Hour in day (1-24)                               | Number             | 24                                    |
| K      | Hour in am/pm (0-11)                             | Number             | 0                                     |
| h      | Hour in am/pm (1-12)                             | Number             | 12                                    |
| m      | Minute in hour                                   | Number             | 30                                    |
| s      | Second in minute                                 | Number             | 55                                    |
| S      | Millisecond                                      | Number             | 978                                   |
| z      | Time zone                                        | General time zone  | Pacific Standard Time; PST; GMT-08:00 |
| Z      | Time zone                                        | RFC 822 time zone  | -0800                                 |
| X      | Time zone                                        | ISO 8601 time zone | -08; -0800; -08:00                    |

