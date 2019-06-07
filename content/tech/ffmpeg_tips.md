---
title: 'FFmpeg tips'
date: 2019-01-22T00:09:12+09:00
categories: 
    - tech
tags: 
    - ffmpeg
    - tips
type: posts
---

A complete, cross-platform solution to record, convert and stream audio and video.
    https://ffmpeg.org/

### 여러개의 동영상 합치기

    ffmpeg -f concat -i list.txt -c copy output.mp4
    
#### 리스트 파일 형식

    cat list.txt
    ---
    /tmp/file1.mp4
    /tmp/file2.mp4
    /tmp/file3.mp4
    /tmp/file4.mp4
