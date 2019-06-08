---
title: 'Mariadb profiling'
date: 2019-06-08T15:13:27+09:00
lastmod: 2019-06-08T15:13:27+09:00
categories: 
  - database
  - mariadb
tags: 
  - profiling
  - mariadb
type: posts
---

### Set global variables

```sql
SET GLOBAL general_log='ON'; 
SET GLOBAL slow_query_log='ON'; 
SET GLOBAL log_output='TABLE'; 
```

### Profile

```sql
SELECT * FROM mysql.general_log;
```
