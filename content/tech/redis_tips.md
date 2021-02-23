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
