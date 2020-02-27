## MPlayer

Install

	sudo apt install mplayer mplayer-fonts

Install GUI version

	sudo apt install smplayer


## Streams

RTSP Viewer

	RTSP_PATH=rtsp://id:pwd@1.1.1.1:3000/Streaming/Channels/101/

	gst-launch-1.0 rtspsrc location="$RTSP_PATH" latency=500 ! rtph264depay ! h264parse ! nvv4l2decoder enable-max-performance=1 ! nvoverlaysink overlay-x=800 overlay-y=50 overlay-w=640 overlay-h=480 overlay=2

cnxsoft@Jetson-Nano:~$ uname -a
Linux Jetson-Nano 4.9.140-tegra #1 SMP PREEMPT Tue Nov 5 13:43:53 PST 2019 aarch64 aarch64 aarch64 GNU/Linux
cnxsoft@Jetson-Nano:~$ cat /etc/lsb-release 
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.3 LTS"
cnxsoft@Jetson-Nano:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/mmcblk0p1   30G   10G   18G  36% /
none            1.7G     0  1.7G   0% /dev
tmpfs           2.0G  4.0K  2.0G   1% /dev/shm
tmpfs           2.0G   30M  2.0G   2% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
tmpfs           396M   20K  396M   1% /run/user/120
tmpfs           396M  136K  396M   1% /run/user/1000
cnxsoft@Jetson-Nano:~$ free -h
              total        used        free      shared  buff/cache   available
Mem:           3.9G        1.7G        449M         49M        1.8G        2.0G
Swap:          1.9G        904K        1.9G
cnxsoft@Jetson-Nano:~$ cat /proc/cpuinfo 
processor : 0
model name : ARMv8 Processor rev 1 (v8l)
BogoMIPS : 38.40
Features : fp asimd evtstrm aes pmull sha1 sha2 crc32
CPU implementer : 0x41
CPU architecture: 8
CPU variant : 0x1
CPU part : 0xd07
CPU revision : 1
 
processor : 1
model name : ARMv8 Processor rev 1 (v8l)
BogoMIPS : 38.40
Features : fp asimd evtstrm aes pmull sha1 sha2 crc32
CPU implementer : 0x41
CPU architecture: 8
CPU variant : 0x1
CPU part : 0xd07
CPU revision : 1
