---
title: 'Mariadb tips'
date: 2019-06-08T15:13:27+09:00
lastmod: 2019-06-08T15:13:27+09:00
categories: 
  - database
  - mariadb
  - tips
tags: 
  - profiling
  - mariadb
  - tips
type: posts
---

### Profiling

```sql
SET GLOBAL general_log='ON'; 
SET GLOBAL slow_query_log='ON'; 
SET GLOBAL log_output='TABLE'; 

SELECT * FROM mysql.general_log;
truncate table mysql.general_log; 
```

### Change date to today

```sql
DATE_ADD(create_date, INTERVAL DATEDIFF(NOW(), create_date) DAY)
```
