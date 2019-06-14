---
title: 'mozjpeg을 활용한 jpeg 이미지 압축'
subtitle: 'Optimizing JPEG image with MozJPEG'
date: 2019-06-13T17:31:12+09:00
categories:
    - library
    - jpeg
    - image
    - compression
tags
    - mozilla jpeg
    - mozjpeg
    - jpeg
    - jpeg encoder
    - 이미지 인코더
    - compression
    - 이미지 압축
    - 사진 압축
    - 무손실 압축
    - image lossless
    - compile
    - 컴파일
    - 리눅스
    - linux
    - 우분투
    - ubuntu
---

### 테스트 설치환경 (Environment)

Ubuntu 18.04

### 필수 라이브러리 설치 (Requirements)

    sudo apt-get update
    sudo apt-get install cmake autoconf automake libtool make pkg-config git nasm

### 소스파일 다운로드 (Download source)

    git clone https://github.com/mozilla/mozjpeg.git

### 컴파일 (Compile)

    cd mozjpeg
    mkdir build && cd build
    sudo cmake ../
    sudo make install

### 이미지 압축 테스트

    ```
    ./cjpeg-static -outfile [output file]  -optimise [input file]
    ```

    ```
    ./cjpeg-static -outfile /gohome/img/my-image-optimized.jpg  -optimise               /gohome/img/my-image.jpg
    ./cjpeg-static -outfile /gohome/img/my-image-20.jpg         -optimise -quality  20  /gohome/img/my-image.jpg
    ./cjpeg-static -outfile /gohome/img/my-image-40.jpg         -optimise -quality  40  /gohome/img/my-image.jpg
    ./cjpeg-static -outfile /gohome/img/my-image-60.jpg         -optimise -quality  60  /gohome/img/my-image.jpg
    ./cjpeg-static -outfile /gohome/img/my-image-80.jpg         -optimise -quality  80  /gohome/img/my-image.jpg
    ./cjpeg-static -outfile /gohome/img/my-image-100.jpg        -optimise -quality 100  /gohome/img/my-image.jpg
    ```
