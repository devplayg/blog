---
title: '2. Zookeeper 설정'
series: 
    - 'Docker 환경에서 Kafka 설치'
date: 2019-06-09T15:55:12+09:00
categories:
  - distributed platform
  - kafka
tags:
  - distributed platform
  - docker
  - kafka
  - zookeeper
  - producer
  - consumer
type: posts
---

### 컨테이너 공통 설정

#### Zookeeper 설정

    vi /kafka/config/zookeeper.properties
    ---
    dataDir=/data
    tickTime=2000
    initLimit=5
    syncLimit=2
    server.1=zoo1:2888:3888
    server.2=zoo2:2888:3888
    server.3=zoo3:2888:3888

### 컨테이너 개별 설정

* zoo1

    ```
    mkdir -p /data && echo 1 > /data/myid
    ```
    
* zoo2

    ```
    mkdir -p /data && echo 2 > /data/myid
    ```
    
* zoo3

    ```
    mkdir -p /data && echo 3 > /data/myid
    ```

### Zookeeper 컨테이너 시작

모든 컨테이터를 순차적으로 시작

    $KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties