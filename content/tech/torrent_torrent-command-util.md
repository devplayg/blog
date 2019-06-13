---
title: '토렌트 클라이언트 명령어 (Torrent client util)
draft: true
---

https://github.com/anacrolix/torrent

토렌트 파일 다운로드

    wget http://releases.ubuntu.com/18.04/ubuntu-18.04.2-desktop-amd64.iso.torrent

다운로드

    ./torrent "http://releases.ubuntu.com/18.04/ubuntu-18.04.2-live-server-amd64.iso.torrent"
    ---
    2019/06/13 01:33:43 main.go:167: <nil>
    2019-06-13 01:33:43 client.go:325: completed bootstrap, [{*dht.Server [dht server on [::]:46417]} {*torrent.Client [0xc000158580]} {dht.TraversalStats [dht.TraversalStats{NumAddrsTried:9, NumResponses:0}]}]
    2019-06-13 01:33:45 portfwd.go:31: discovered 0 upnp devices
    ubuntu-18.04.2-live-server-amd64.iso [--------------------------------------------------------------------]   1% downloading (12 MB/874 MB)
    ubuntu-18.04.2-live-server-amd64.iso [==>-----------------------------------------------------------------]   6% downloading (57 MB/874 MB)
    ubuntu-18.04.2-live-server-amd64.iso [========>-----------------------------------------------------------]  15% downloading (134 MB/874 MB)
    ubuntu-18.04.2-live-server-amd64.iso [============================>---------------------------------------]  43% downloading (385 MB/874 MB)
    ubuntu-18.04.2-live-server-amd64.iso [=====================================>------------------------------]  57% downloading (500 MB/874 MB)
    ubuntu-18.04.2-live-server-amd64.iso [======================================>-----------------------------]  58% downloading (513 MB/874 MB)
    ubuntu-18.04.2-live-server-amd64.iso [===========================================>------------------------]  65% downloading (571 MB/874 MB)
    ubuntu-18.04.2-live-server-amd64.iso [=================================================================>--]  96% downloading (847 MB/874 MB)
    2019/06/13 01:36:16 main.go:214: downloaded ALL the torrents
    2019-06-13 01:36:16 torrent.go:669: Sending stopped event to trackers

다운로드 확인

    ls -l
    ---
    total 2536604
    -rwxr-xr-x 1 root root   17899464 Jun 13 01:31 torrent
    -rwxr-xr-x 1 root root 1704984576 Jun 13 01:33 ubuntu-18.04.2-desktop-amd64.iso
    -rwxr-xr-x 1 root root      76500 Feb 14 22:51 ubuntu-18.04.2-desktop-amd64.iso.torrent

Checksum 확인

    md5sum ubuntu-18.04.2-live-server-amd64.iso
    ---
    fcbcc756a1aa5314d52e882067c4ca6a  ubuntu-18.04.2-live-server-amd64.iso

    curl http://releases.ubuntu.com/18.04/MD5SUMS
    ---
    69809dc7e058b81bc781fe3e24d3204f *ubuntu-18.04.2-desktop-amd64.iso
    fcbcc756a1aa5314d52e882067c4ca6a *ubuntu-18.04.2-live-server-amd64.iso

