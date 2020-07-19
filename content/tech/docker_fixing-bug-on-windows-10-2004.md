---
title: Cannot start docker desktop on win 10 home 2004
date: 2020-07-10T00:00:00+09:00
categories:
  - tech
tags:
  - docker
  - windows 10
  - windows 10 2004  
---

## 윈도우 버전 확인

    winver


## WSL 2 Linux 커널 업데이트

https://docs.microsoft.com/ko-KR/windows/wsl/wsl2-kernel

wsl -l -v

## WSL 2 로 변환Link to WSL 2 로 변환

     wsl --set-version Ubuntu 2


## Default 

    wsl --set-default Ubuntu

## Remove docker

## Install docker
