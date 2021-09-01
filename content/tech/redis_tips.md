---
title: Redis Tips
---

### Commands

Common

    keys *
    del [key...]
    keys *str*
    clear
    flushall
    smembers []

Set

    hmset user id 1234 name tom pw 12341
    hget user name
    del user

### Create redis-cluster with Docker

```
version: '3.1'

services:

  redis-cluster:
    container_name: redis-cluster
    image: grokzen/redis-cluster
    environment:
      IP: "0.0.0.0"
      STANDALONE: "false"
    ports:
      - 7001-7003:7001-7003
```
