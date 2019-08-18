---
title: 'Windows에 VXG Server 설치'
type: posts
date: 2019-08-10T15:13:27+09:00
category:
    - installation
    - docker
tags:
    - vxg
    - vxg server
---

### VXG Server 다운로드

[Download](https://dashboard.videoexpertsgroup.com/?downloads=)

### HTTPS 인증서 생성 (옵션)

생성 과정은 [링크](../openssl_generate-cert) 참조 

    $ dir E:\vxg\certificate
    certificate.crt  
    certificate.csr  
    private.key       
    

### VXG Server 설치

    $ start.bat -h 127.0.0.1 -c e:\vxg\certificate
    ... (생략)
    CREATE TRIGGER
    Writing output to /opt/skyvr/nginx/bin/skyvr_conf.lua
    Writing output to /opt/skyvr/nginx/conf/nginx.conf
     * Starting periodic command scheduler cron
       ...done.
    accp_web is stopped
    Starting accp_web ...
    rename /var/log/vxg/svcp/accp_web.log.1 /var/log/vxg/svcp/accp_web.log.2
    rename /var/log/vxg/svcp/accp_web.log /var/log/vxg/svcp/accp_web.log.1

    VXG Server version 1.3.293.20190704.077f5985853a on system D6D39390-FB1A-11E7-B880-6E66E9EE1C00 started, please visit http://127.0.0.1:8000/ or https://127.0.0.1:8443/ in your browser

### VXG 동작 확인 및 접속

Docker 상태
    
    $ docker ps -a
        
    CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS                      PORTS     NAMES
    c946c7e9543e        vxg_server:1.3.293.20190704   "/bin/sh -c /opt/sky…"   10 hours ago        Up 10 hours                 (생략)   vxg_server
    
Web 클라이언트 접속 (ID: admin / PW: admin)

    https://127.0.0.1:8443
    
위에서 생략된 Docker port forwarding 항목들

    0.0.0.0:83->83/tcp
    0.0.0.0:86->86/tcp
    0.0.0.0:554->554/tcp
    0.0.0.0:1935-1936->1935-1936/tcp
    0.0.0.0:8000->8000/tcp
    0.0.0.0:8080->8080/tcp
    0.0.0.0:8083->8083/tcp
    0.0.0.0: 8443->8443/tcp
    0.0.0.0:8883->8883/tcp
    0.0.0.0:8888->8888/tcp
    0.0.0.0:9443->9443/tcp
    0.0.0.0:12050->12050/tcp
    0.0.0.0:12443->12443/tcp
    

### MinIO(VXG-Storage) 설치

VXG Server의 Docker network 확인

    $ docker inspect vxg_server | findstr NetworkMode
    "NetworkMode": "vxg-server-net",

Access key와 Secret key 는 Web의 [Settings - Storage] 참고

![Keys](key.png)

    docker run -p 9000:9000 --name vxg-server-storage --net vxg-server-net -e "MINIO_ACCESS_KEY=###ACCESS-KEY###" -e "MINIO_SECRET_KEY=###SECRET-KEY###" -v E:/vxg/storage:/data minio/minio  server /data
    
Docker container 확인

    CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS                             PORTS                     NAMES
    c40ea41aba57        minio/minio                   "/usr/bin/docker-ent…"   13 seconds ago      Up 11 seconds (health: starting)   0.0.0.0:9000->9000/tcp    vxg-server-storage
    c946c7e9543e        vxg_server:1.3.293.20190704   "/bin/sh -c /opt/sky…"   10 hours ago        Up 10 hours                        (생략)                    vxg_server


MinIO 의 Docker network 확인

    $ docker inspect vxg-server-storage | findstr NetworkMode
    "NetworkMode": "vxg-server-net",
    
### MinIO 접속

http://127.0.0.1:9000

ID: ###ACCESS-KEY### / PW: ###SECRET-KEY###

                                                                                                                                                   ts
### 테스트 코드

    docker stop vxg_server && docker rm vxg_server
    docker stop vxg-server-storage && docker rm vxg-server-storage
    