---
title: 'Ubuntu 18.04 에 Kafka 설치'
date: 2019-06-26T13:10:00+09:00
categories:
    - tech
tags:
    - kafka
    - java
    - openjdk
    - ubuntu
---

## 요구사항

* Ubuntu 18.04
* OpenJDK 11.0.3
* kafka를 실행할 root 가 아닌 일반유저 (여기서는 사용자이름은 "kafka"로 정의)

## 환경 확인

시스템 정보

    $ uname -a
    Linux kafka 4.15.0-52-generic #56-Ubuntu SMP Tue Jun 4 22:49:08 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

OS 종류 확인

    $ cat /etc/issue
    Ubuntu 18.04.2 LTS \n \l

Repository 경로를 국내(Kakao Mirror) 사이트로 변경 (Optional)

    $ sudo sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
    $ sudo apt update

OpenJDK 설치

    $ sudo apt install -y openjdk-11-jdk
    $ java -version
    openjdk version "11.0.3" 2019-04-16
    OpenJDK Runtime Environment (build 11.0.3+7-Ubuntu-1ubuntu218.04.1)
    OpenJDK 64-Bit Server VM (build 11.0.3+7-Ubuntu-1ubuntu218.04.1, mixed mode, sharing)

### Step 1 - 사용자 생성

Kafka 를 실행할 사용자("kafka") 생성

    $ sudo adduser kafka
    Adding user `kafka' ...
    Adding new group `kafka' (1001) ...
    Adding new user `kafka' (1001) with group `kafka' ...
    Creating home directory `/home/kafka' ...
    Copying files from `/etc/skel' ...
    Enter new UNIX password:
    Retype new UNIX password:
    passwd: password updated successfully
    Changing the user information for kafka
    Enter the new value, or press ENTER for the default
            Full Name []: Kafka
            Room Number []:
            Work Phone []:
            Home Phone []:
            Other []:
    Is the information correct? [Y/n] y

"kafka" 사용자를 sudo 그룹에 등록

    $ sudo adduser kafka sudo
    Adding user `kafka' to group `sudo' ...
    Adding user kafka to group sudo
    Done.

"kafka" 사용자로 로그인

    $ su - kafka
    kafka$ id
    uid=1001(kafka) gid=1001(kafka) groups=1001(kafka),27(sudo)

## Step 2 - Kafka 설치

설치경로 ~kafka/kafka

    kafka$ curl -sL http://apache.mirror.cdnetworks.com/kafka/2.2.1/kafka_2.12-2.2.1.tgz | tar xvz -C ~
    kafka$ ln -s kafka_2.12-2.2.1/ ~/kafka
    kafka@kafka:~$ ls -l ~
    drwxrwxr-x 2 kafka kafka 4096 Jun 26 00:50 download
    lrwxrwxrwx 1 kafka kafka   17 Jun 26 00:54 kafka -> kafka_2.12-2.2.1/
    drwxr-xr-x 6 kafka kafka 4096 May 13 16:18 kafka_2.12-2.2.1

## Step 3 - Kafka 설정

디렉토리 생성

     kafka$ sudo mkdir /data1 /data2
     kafka$ sudo chown -R kafka:kafka /data1 /data2

설정파일 변경

     kafka$ sudo vi ~/kafka/config/server.properties
     listeners=PLAINTEXT://0.0.0.0:9092
     advertised.listeners=PLAINTEXT://192.168.0.117:9092
     delete.topic.enable = true

Zookeeper 서비스 등록

    $ sudo vi /etc/systemd/system/zookeeper.service

    [Unit]
    Requires=network.target remote-fs.target
    After=network.target remote-fs.target

    [Service]
    Type=simple
    User=kafka
    ExecStart=/home/kafka/kafka/bin/zookeeper-server-start.sh /home/kafka/kafka/config/zookeeper.properties
    ExecStop=/home/kafka/kafka/bin/zookeeper-server-stop.sh
    Restart=on-abnormal

    [Install]
    WantedBy=multi-user.target

Kafka 서비스 등록

    $ sudo vi  /etc/systemd/system/kafka.service

    [Unit]
    Requires=zookeeper.service
    After=zookeeper.service

    [Service]
    Type=simple
    User=kafka
    ExecStart=/home/kafka/kafka/bin/kafka-server-start.sh /home/kafka/kafka/config/server.properties
    ExecStop=/home/kafka/kafka/bin/kafka-server-stop.sh
    Restart=on-abnormal

    [Install]
    WantedBy=multi-user.target

    $ sudo systemctl enable zookeeper
    $ sudo systemctl enable kafka

    $ sudo systemctl start zookeeper
    $ sudo netstat -lntp
    ..
    tcp6       0      0 :::2181                 :::*                    LISTEN      15272/java
    tcp6       0      0 :::40009                :::*                    LISTEN      15272/java (변동 포트)
    ..

    $ sudo systemctl start kafka
    tcp6       0      0 :::9092                 :::*                    LISTEN      15674/java
    tcp6       0      0 :::35253                :::*                    LISTEN      15674/java (변동 포트)

### Step 4 - 테스트

토픽 생성

    $ ~/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic my-topic

토픽 확인

    $ ~/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --list
    my-topic

Consumer 에서 메시지 처리 준비

    $ ~/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic my-topic --from-beginning
    (대기)

다른 Console 창에서 Producer 에서 메시지 전송

    $ echo "Hello, World" | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-topic
    $ ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-topic
    (입력)
