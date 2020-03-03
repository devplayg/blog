---
title: 'Jetson TX2 - Check system information'
date: 2020-02-27T00:00:00+09:00
type: posts
series:
    - NVIDIA Jetson
categories:
    - nvidia
tags:
    - nvidia
    - Jetson TX2
---

## System Info

System info

```coffeescript
$ uname -a
Linux unisem-desktop 4.9.140-tegra #1 SMP PREEMPT Mon Dec 9 22:52:02 PST 2019 aarch64 aarch64 aarch64 GNU/Linux
```

OS

    $ cat /etc/lsb-release 

Memory

    $ free -h

CPU

    $ cat /proc/cpuinfo 

Disk

    $ df -h
