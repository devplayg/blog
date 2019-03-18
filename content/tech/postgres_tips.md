---
title: "PostgreSQL tips"
date: 2019-03-18T21:34:36+09:00
lastmod: 2019-03-18T21:34:36+09:00
tags : [ "database", "db", "postgres", "postgresql"]
categories : [ "tech" ]
layout: post
type:  "post"
draft: false
---


### List users

    \du
    \du+


### Add user

```sql
postgres=# create role won;
CREATE ROLE

postgres=# \du won
List of roles
Role name |  Attributes  | Member of
-----------+--------------+-----------
won       | Cannot login | {}

alter role won LOGIN password 'won';
```


### Use database

```
 \c fabricexplorer
```


### List databases

    \l
    \l+

