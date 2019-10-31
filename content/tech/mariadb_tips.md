---
title: 'Mariadb tips'
date: 2019-06-08T15:13:27+09:00
lastmod: 2019-06-08T15:13:27+09:00
categories: 
  - database
  - tips
tags: 
  - profiling
  - mariadb
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
update table_name set date = DATE_ADD(date, INTERVAL DATEDIFF(NOW(), date) DAY);
```

### Add account

```sql
create user 'root'@'%' identified by 'YOURPASSWORD';
grant all privileges on *.* to 'root'@'%';
flush privileges;
```

### Change password

```sql
alter user 'root'@'%' identified by 'NEWPASSWORD';
flush privileges;
```
