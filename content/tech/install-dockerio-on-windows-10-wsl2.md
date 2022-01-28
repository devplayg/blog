---
title: 윈도우10, Docker Desktop 없이 사용하기
date: 2022-01-28T00:00:00+09:00
type: posts
categories:
   - docker
   - windows
tags:
    - docker
    - windows
    - docker desktop
    - 윈도우 Docker Desktop 대체
---

Microsoft Store 에서 Window Terminal 설치

- https://docs.microsoft.com/ko-kr/windows/terminal/install

관리자 권한으로 Window Terminal 실행 후 WSL2 설치명령어 실행

    wsl.exe --install
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Microsoft Store 에서 필요한 Ubuntu 설치

WSL2 설치확인

    wsl -l -v
    ----
    NAME            STATE           VERSION
    * Ubuntu-18.04    Running         2

Docker 설치

    sudo apt update
    sudo apt upgrade
    sudo apt install docker.io

Docker 버전확인

    docker version

Docker 시작

    sudo dockerd &
