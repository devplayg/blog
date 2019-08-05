---
title: 'FFmpeg tips'
type: posts
date: 2019-01-22T00:09:12+09:00
lastmod: 2019-08-02T00:00:00+09:00
type: posts
categories: 
  - util
  - ffmpeg
  - tips
tags:
  - tips
  - ffmpeg
---

A complete, cross-platform solution to record, convert and stream audio and video.
    https://ffmpeg.org/

### Concatenating files

    $ cat list.txt
    /tmp/file1.mp4
    /tmp/file2.mp4
    /tmp/file3.mp4
    /tmp/file4.mp4
    
    $ ffmpeg -f concat -i list.txt -c copy output.mp4
    
### Download RTSP stream

    ffmpeg -i rtsp://ID:PASSWORD@IP -acodec copy -vcodec copy /path/to/file
