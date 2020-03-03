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



```sh
unisem@unisem-desktop:~/dev$ uname -a
Linux unisem-desktop 4.9.140-tegra #1 SMP PREEMPT Mon Dec 9 22:52:02 PST 2019 aarch64 aarch64 aarch64 GNU/Linux
unisem@unisem-desktop:~/dev$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/mmcblk0p1   28G   18G  8.1G  69% /
none            3.8G     0  3.8G   0% /dev
tmpfs           3.9G   52M  3.8G   2% /dev/shm
tmpfs           3.9G   54M  3.8G   2% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           3.9G     0  3.9G   0% /sys/fs/cgroup
tmpfs           786M   12K  786M   1% /run/user/120
tmpfs           786M   40K  786M   1% /run/user/1000
unisem@unisem-desktop:~/dev$ free -h
              total        used        free      shared  buff/cache   available
Mem:           7.7G        3.4G        2.2G        107M        2.1G        4.7G
Swap:          3.8G          0B        3.8G
unisem@unisem-desktop:~/dev$ cat /proc/cpuinfo 
processor	: 0
model name	: ARMv8 Processor rev 3 (v8l)
BogoMIPS	: 62.50
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd07
CPU revision	: 3

processor	: 3
model name	: ARMv8 Processor rev 3 (v8l)
BogoMIPS	: 62.50
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd07
CPU revision	: 3

processor	: 4
model name	: ARMv8 Processor rev 3 (v8l)
BogoMIPS	: 62.50
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd07
CPU revision	: 3

processor	: 5
model name	: ARMv8 Processor rev 3 (v8l)
BogoMIPS	: 62.50
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd07
CPU revision	: 3
```
