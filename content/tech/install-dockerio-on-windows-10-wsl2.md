---
title: 윈도우 Docker Desktop 대체
date: 2022-01-28T00:00:00+09:00
type: posts
categories:
   - docker
   - windows
tags:
    - docker
    - windows
    - docker desktop
---

Microsoft Store 에서 Window Terminal 설치

- https://docs.microsoft.com/ko-kr/windows/terminal/install


WSL2 설치

    wsl.exe --install 
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Microsoft Store에서 Ubuntu 설치

WSL2 설치확인

    PS C:\Users\YOUR_ACCOUNT> wsl -l -v
    NAME            STATE           VERSION
    * Ubuntu-18.04    Running         2

Docker.io 설치

    sudo apt update
    sudo apt upgrade
    sudo apt install docker.io

start

    sudo dockerd
