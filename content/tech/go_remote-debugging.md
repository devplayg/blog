---
title: Go 원격 디버깅
date: 2020-05-24T09:00:04+09:00
type: posts
categories:
  - programming language
tags:
  - go
  - debugging
---

* 개발은 PC에서
* 실행은 Server에서

## 1. 개발 PC에서

### Goland 설정

[Run] - [Run] - [Edit configuration] 선택

![01.jpg](01.jpg)    

![01.jpg](02.jpg)

### 디버깅 환경 추가

![01.jpg](03.jpg)

### 디버깅 호스트(디버깅 대상 서버) 설정

호스트 이름만 입력; 아직 "Run" 실행하지 않음

아래 옵설명 참고; 


![01.jpg](04.jpg)


## 2. 서버

### delve 라이브러리 설치

https://github.com/go-delve/delve

    $ go get github.com/go-delve/delve/cmd/dlv
    $ cd $GOPATH/src/github.com/go-delve/delve
    $ make install

### 디버깅 대상 소스 컴파일

    $ cd $GOPATH/src/github.com/devplayg/goback/cmd/goback
    $ go build -gcflags "all=-N -l"

### 바이너리 실행

    $ dlv --listen=:2345 --headless=true --api-version=2 --accept-multiclient exec ./goback


## 3. 개발 PC

디버깅 실행
    
    
    
