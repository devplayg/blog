---
title: 'Jetson TX2 tips'
date: 2020-02-27T00:00:00+09:00
type: posts
series:
    - NVIDIA Jetson
categories:
    - nvidia
tags:
    - nvidia
    - Jetson TX2
---

## RTSP Viewer

    RTSP_PATH=rtsp://id:pwd@1.1.1.1:3000/Streaming/Channels/101/
	gst-launch-1.0 rtspsrc location="$RTSP_PATH" latency=500 ! rtph264depay ! h264parse ! nvv4l2decoder enable-max-performance=1 ! nvoverlaysink overlay-x=800 overlay-y=50 overlay-w=640 overlay-h=480 overlay=2