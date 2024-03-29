---
title: 'Kafka tips'
type: posts
date: 2019-06-11T18:55:12+09:00
lasmod: 2019-06-16T17:14:41+09:00
categories:
  - messageQ
  - tips
tags:
  - kafka
  - docker
  - zookeeper
  - producer
  - consumer
---

### Create topic

    $KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server $KAFKA --replication-factor 3 --partitions 5 --topic my-topic --create

### List topics

    $KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server $KAFKA --list

### Describe topic

    $KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server $KAFKA --describe --topic my-topic
    
### Delete topic
    
    $KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server $KAFKA --delete --topic my-topic

### Get offsets in topic

* Earliest offsets
    
    ```
    $KAFKA_HOME/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $KAFKA -topic my-topic --time -1
    ```

* Latest offsets

    ```
    $KAFKA_HOME/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $KAFKA -topic my-topic --time -2
    ```
    
### List groups

    $ $KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $KAFKA --list
    testgroup1
    testgroup2

### Describe group

    $ $KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $KAFKA --describe --group testgroup2
    Consumer group 'testgroup2' has no active members.
    TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID     HOST            CLIENT-ID
    test-offset     2          60              60              0               -               -               -
    test-offset     1          40              61              21              -               -               -
    test-offset     0          40              57              17              -               -               -
    test-offset     4          64              64              0               -               -               -
    test-offset     3          58              58              0               -               -               -
    
### Reset offsets

    $ $KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $KAFKA --group testgroup2 --topic test-offset --reset-offsets --to-earliest --execute
    TOPIC                          PARTITION  NEW-OFFSET
    test-offset                    2          0
    test-offset                    1          0
    test-offset                    0          0
    test-offset                    4          0
    test-offset                    3          0


    $ $KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $KAFKA --describe --group testgroup2
    Consumer group 'testgroup2' has no active members.
    TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID     HOST            CLIENT-ID
    test-offset     2          0               60              60              -               -               -
    test-offset     1          0               61              61              -               -               -
    test-offset     0          0               57              57              -               -               -
    test-offset     4          0               64              64              -               -               -
    test-offset     3          0               58              58              -               -               -
    
    
### Shift offsets

    $ $KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $KAFKA --group testgroup2 --reset-offsets --shift-by -10 --topic test-offset --execute
