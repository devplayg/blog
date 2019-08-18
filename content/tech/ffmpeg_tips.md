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

### To list the supported, connected capture devices:

    ffmpeg -y -f vfwcap -i list
    
### Encode video from the camera
    
    ffmpeg -f vfwcap -r 15 -i 0 out.mp4

### IP Camera to RTSP Stream

Client (Receiver)

    ffplay -rtsp_flags listen rtsp://localhost:8888/live.sdp?tcp

Server (Sender)

    ffmpeg -f vfwcap -r 15 -i 0 -f rtsp -rtsp_transport tcp rtsp://localhost:8888/live.sdp
    