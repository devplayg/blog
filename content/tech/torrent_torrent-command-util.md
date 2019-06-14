---
title: 'Go언어로 토렌트 클라이언트를 실행해보자'
subtitle: 'Torrent command-line client in Go'
date: 2019-06-13T13:11:09+09:00
categories:
    - util
    - torrent
    - go
tags
    - golang
    - go
    - Go언어
    - torrent
    - torrent client
    - command line
    - download
    - 토렌트
    - 토렌트 클라이언트
---

### 테스트 환경 (Environment)

Ubuntu 18.84

Torrent Library (https://github.com/anacrolix/torrent)


### 소스 다운로드 (Clone the git repository)

    $ go get github.com/anacrolix/torrent
    $ go get github.com/anacrolix/torrent
    $ go get github.com/anacrolix/envpprof
    $ go get github.com/anacrolix/tagflag

    $ cd $GOPATH/src/github.com/anacrolix/torrent/cmd/torrent
    $ go build
    $ ls -l torrent
    -rwxr-xr-x 1 root root 17899680 Jun 14 00:55 torrent

### 토렌트 파일 다운로드 (Download .torrent file)

    $ wget http://releases.ubuntu.com/18.04/ubuntu-18.04.2-desktop-amd64.iso.torrent

### 토렌트 클라이언트 시작 (Run torrent)

토렌트 파일을 사용하는 경우(.torrent)

    $ ./torrent "http://releases.ubuntu.com/18.04/ubuntu-18.04.2-live-server-amd64.iso.torrent"
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

마그넷(magnet) 을 사용하는 경우

    $ ./torrent 'magnet:?xt=urn:btih:KRWPCX3SJUM4IMM4YF5RPHL6ANPYTQPU'
    2019/06/14 01:04:02 main.go:167: <nil>
     [--------------------------------------------------------------------]   0% getting info
     [--------------------------------------------------------------------]   0% getting info
    ubuntu-14.04.2-desktop-amd64.iso [--------------------------------------------------------------------]   1% downloading (7.4 MB/1.0 GB)
    (생략)

### 파일 확인 (Check MD5 checksums)

    $ ls -l
    total 2536604
    -rwxr-xr-x 1 root root   17899464 Jun 13 01:31 torrent
    -rwxr-xr-x 1 root root 1704984576 Jun 13 01:33 ubuntu-18.04.2-desktop-amd64.iso
    -rwxr-xr-x 1 root root      76500 Feb 14 22:51 ubuntu-18.04.2-desktop-amd64.iso.torrent

    $ md5sum ubuntu-18.04.2-live-server-amd64.iso
    fcbcc756a1aa5314d52e882067c4ca6a  ubuntu-18.04.2-live-server-amd64.iso

    $ curl http://releases.ubuntu.com/18.04/MD5SUMS
    fcbcc756a1aa5314d52e882067c4ca6a *ubuntu-18.04.2-live-server-amd64.iso
    ..(생략)

