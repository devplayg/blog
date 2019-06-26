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

* Kafka 2.12
* OpenJDK 11.0.3
* Ubuntu 18.04

## 환경 확인

#### 시스템 정보

```shell
$ uname -a
Linux kafka 4.15.0-52-generic #56-Ubuntu SMP Tue Jun 4 22:49:08 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

#### OS 종류 확인

```shell
$ cat /etc/issue
Ubuntu 18.04.2 LTS \n \l
```

#### Repository 경로를 국내(Kakao Mirror) 사이트로 변경 (Optional)

```shell
$ sudo sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
$ sudo apt update
```

#### OpenJDK 설치

```shell
$ sudo apt install -y openjdk-11-jdk
```

## Step 1 - 사용자 생성

#### Kafka 를 실행할 사용자("kafka") 생성

```shell
$ sudo adduser kafka
```

#### "kafka" 사용자를 sudo 그룹에 등록

```shell
$ sudo adduser kafka sudo
```

#### "kafka" 사용자로 로그인

```shell
$ su - kafka
```

## Step 2 - Kafka 설치

#### 설치경로 $HOME/kafka/kafka

```shell
kafka$ curl -sL http://apache.mirror.cdnetworks.com/kafka/2.2.1/kafka_2.12-2.2.1.tgz | tar xvz -C ~
kafka$ ln -s kafka_2.12-2.2.1/ ~/kafka
kafka$ ls -l ~
lrwxrwxrwx 1 kafka kafka   17 Jun 26 00:54 kafka -> kafka_2.12-2.2.1/
drwxr-xr-x 6 kafka kafka 4096 May 13 16:18 kafka_2.12-2.2.1
```

## Step 3 - Kafka 설정

#### 디렉토리 생성

```shell
kafka$ sudo mkdir /data1 /data2
kafka$ sudo chown -R kafka:kafka /data1 /data2
```

#### 설정파일 변경

```shell
kafka$ sudo vi ~/kafka/config/server.properties
```
```ini
listeners=PLAINTEXT://0.0.0.0:9092
advertised.listeners=PLAINTEXT://192.168.0.117:9092
delete.topic.enable = true
```

## Step 4 - 서비스 등록

#### Zookeeper 서비스 파일 생성

```shell
kafka$ sudo vi /etc/systemd/system/zookeeper.service
```

```ini
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
```

#### Zookeeper 서비스 등록 및 시작

```shell
kafka$ sudo systemctl enable zookeeper
kafka$ sudo systemctl start zookeeper
kafka$ sudo netstat -lntp
tcp6       0      0 :::2181                 :::*                    LISTEN      15272/java
tcp6       0      0 :::40009                :::*                    LISTEN      15272/java (변동 포트)
..
```

#### Kafka 서비스 파일 생성

```shell
kafka$ sudo vi /etc/systemd/system/kafka.service
```

```ini
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
```

#### Kafka 서비스 등록 및 시작

```shell
kafka$ sudo systemctl enable kafka
kafka$ sudo systemctl start kafka
kafka$ sudo netstat -lntp
tcp6       0      0 :::9092                 :::*                    LISTEN      15674/java
tcp6       0      0 :::35253                :::*                    LISTEN      15674/java (변동 포트)
..
```

## Step 5 - 테스트

#### Topic 생성

```shell
kafka$ ~/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic my-topic
```

#### Topic 확인

```shell
kafka$ ~/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --list
my-topic
```

#### Consumer 에서 메시지 처리 준비

```shell
kafka$ ~/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic my-topic --from-beginning
(대기)
```

#### 다른 Console 창에서 Producer 에서 메시지 전송

```shell
kafka$ echo "Hello, World" | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-topic
kafka$ ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-topic
(입력)
```