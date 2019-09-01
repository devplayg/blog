---
title: 'Go-Media-Framework installation on Ubuntu 18.04'
date: 2019-09-01T03:00:00+09:00
type: posts
categories:
    - ai
    - compile
tags:
    - ai
    - compile
    - ffmpeg
    - ubuntu 18.04
    - gmf
    - golang
---

### Installing Go


### Set env


    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/ffmpeg_build/lib/pkgconfig/

Check

    pkg-config --libs libavformat

    $ vi ~/.profile
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/ffmpeg_build/lib
    
### Install

    go get github.com/3d0c/gmf
    