---
title: 'MozJPEG 를 활용한 JPEG 압축'
series:
    - 'MozJPEG 를 활용한 JPEG 압축'
date: 2019-06-16T14:24:39+09:00
categories: 
  - util
tags: 
  - jpeg 압축
  - 이미지 압축
  - jpeg 크키 줄이기
  - ubuntu
type: posts
---

### 테스트 환경

Ubuntu 18.04 container on Docker

### 필수 라이브러리 설치 (Requirements)

    $ sudo apt-get update
    $ sudo apt-get install cmake autoconf automake libtool make pkg-config git nasm

### 소스파일 다운로드 (Download source)

    $ git clone https://github.com/mozilla/mozjpeg.git

### 컴파일 (Compile)

    $ cd mozjpeg
    $ mkdir build && cd build
    $ sudo cmake ../
    $ sudo make install

### 이미지 압축 테스트 (Test)

실행방법

    $ ./cjpeg-static -outfile [output file]  -optimise [input file]

압축품질 설정

    $ ./cjpeg-static -outfile my-image-optimized.jpg  -optimise               my-image.jpg
    $ ./cjpeg-static -outfile my-image-80.jpg         -optimise -quality  80  my-image.jpg

