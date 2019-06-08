---
title: 'FFmpeg tips'
date: 2019-01-22T00:09:12+09:00
categories: 
  - util
  - ffmpeg
tags:
  - tips
  - ffmpeg
type: posts
---

A complete, cross-platform solution to record, convert and stream audio and video.
    https://ffmpeg.org/

### Concatenating files

    ffmpeg -f concat -i list.txt -c copy output.mp4
    
#### list.txt

    cat list.txt
    ---
    /tmp/file1.mp4
    /tmp/file2.mp4
    /tmp/file3.mp4
    /tmp/file4.mp4
