---
title: 'FFmpeg tips'
type: posts
date: 2019-01-22T00:09:12+09:00
lastmod: 2019-08-02T00:00:00+09:00
type: posts
categories: 
    - util
    - command-line
tags:
    - ffmpeg
---

A complete, cross-platform solution to record, convert and stream audio and video.
    https://ffmpeg.org/

### Concatenating video files

    $ cat list.txt
    file /tmp/file1.mp4
    file /tmp/file2.mp4
    file /tmp/file3.mp4
    file /tmp/file4.mp4
    
    $ ffmpeg -f concat -i list.txt -c copy output.mp4
    
### Cutting video
    
00:00:00 ~ 00:00:05    
    
    fmpeg -i sample.mp4 -vcodec copy -acodec copy -ss 00:00:00 -to 00:00:05 cut.mp4
    
00:00:03 ~ 00:00:19

    ffmpeg -i sample.mp4 -ss 00:00:03 -t 00:00:16 -async 1 cut2.mp4
    
### Download RTSP stream

    ffmpeg -i rtsp://ID:PASSWORD@IP -acodec copy -vcodec copy /path/to/file
    
### List supported devices

DirecShow: https://trac.ffmpeg.org/wiki/DirectShow 

    $ ffmpeg -y -f vfwcap -i list
    ---
    [vfwcap @ 00000226d24d94c0] Driver 0
    [vfwcap @ 00000226d24d94c0]  Microsoft WDM Image Capture (Win32)
    [vfwcap @ 00000226d24d94c0]  Version:  10.0.17763.1
    
    $ ffmpeg -list_devices true -f dshow -i dummy
    ---
    [dshow @ 000002a00a8395c0] DirectShow video devices (some may be both video and audio devices)
    [dshow @ 000002a00a8395c0]  "720p HD Camera"
    [dshow @ 000002a00a8395c0]     Alternative name "@device_pnp_\\?\usb#vid_2232&pid_1083&mi_00#6&5f134b1&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
    [dshow @ 000002a00a8395c0] DirectShow audio devices
    [dshow @ 000002a00a8395c0]  "Blablabla(Realtek High Definition Audio(SST))"
    [dshow @ 000002a00a8395c0]     Alternative name "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{57219422-ACFD-4807-AB0C-F531287BA5E6}"

### List device options
 
Audio

    ffmpeg -f dshow -list_options true -i audio="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{57219422-ACFD-4807-AB0C-F531287BA5E6}"

Video

    ffmpeg -f dshow -list_options true -i video="720p HD Camera"
    ffmpeg -f dshow -list_options true -i video="@device_pnp_\\?\usb#vid_2232&pid_1083&mi_00#6&5f134b1&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
    
### Capture 
    
Audio
    
    ffmpeg -f dshow -i audio="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{57219422-ACFD-4807-AB0C-F531287BA5E6}" output.mp3
    
Video

    ffmpeg -f vfwcap -r 15 -i 0 out.mp4
    ffmpeg -f vfwcap -r 15 -i video="720p HD Camera" out.mp4

Video to separated files  [Muxer](http://ffmpeg.org/ffmpeg-formats.html#segment_002c-stream_005fsegment_002c-ssegment)

    ffmpeg -f vfwcap -framerate 15 -i 0 -c:v libx264 -g 15 -c:a aac -preset veryfast -segment_time 2 -segment_wrap 24 -f segment live%03d.ts
    
Video & Audio to separated files

    ffmpeg -f vfwcap -i video="720p HD Camera":audio="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{57219422-ACFD-4807-AB0C-F531287BA5E6}" -framerate 15 -c:v libx264 -g 15 -c:a aac -preset veryfast -segment_time 2 -segment_wrap 24 -f segment live%03d.ts

### IP Camera to RTSP Stream

Client (Receiver)

    ffplay -rtsp_flags listen rtsp://localhost:8888/live.sdp?tcp

Server (Sender)

    ffmpeg -f vfwcap -r 15 -i 0 -f rtsp -rtsp_transport tcp rtsp://localhost:8888/live.sdp

### RTSP 

2초마다 ts파일 생성

    ffmpeg
        -v error
        -rtsp_transport tcp
        -probesize 500k
        -analyzeduration 1500000
        -i rtsp://URL
        -map 0:0
        -flags:v global_header
        -bsf:v dump_extra
        -c copy
        -fflags +igndts
        -preset veryfast
        -segment_time 2
        -segment_wrap 24
        -f segment live%03d.ts


VXG FFMpeg Option

    ffmpeg
        -v error
        -rtsp_transport tcp
        -probesize 500k
        -analyzeduration 1500000
        -i rtsp://URL
        -map 0:0
        -flags:v global_header
        -bsf:v dump_extra
        -c copy
        -fflags +igndts
        -f flv rtmp://URL


"RTSP-Strean" options

    ffmpeg
        -y
        -fflags nobuffer
        -rtsp_transport tcp
        -i rtsp://URL
        -vsync 0
        -copyts
        -vcodec copy
        -movflags frag_keyframe+empty_moov
        -an
        -hls_flags append_list
        -f hls
        -segment_list_flags live
        -hls_time 1
        -hls_list_size 3
        -hls_segment_filename ./videos/a8002e0a-5453-442f-8f34-b17dd49b213f/%d.ts ./videos/a8002e0a-5453-442f-8f34-b17dd49b213f/index.m3u8

Streaming MP4 to RTMP

    ffmpeg
        -re
        -i sample.mp4
        -c copy
        -f flv rtmp://localhost/movie


Streaming RTSP to RTMP

    ffmpeg
        -re
        -rtsp_transport tcp
        -i rtsp://URL
        -c copy
        -f flv rtmp://localhost/movie
