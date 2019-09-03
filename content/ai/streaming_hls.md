---
title: '잠이 안와서 테스트 해 본 HLS 스트리밍'
date: 2019-09-04T01:00:00+09:00
type: posts
categories: 
    - streaming
tags:
    - ubuntu 18.04
    - ffmpeg
    - m3u8
    - docker
---

캐냐AA 커피원두가 도착했다. 밤 10시에 라떼를 한 잔 마셨더니 잠이 안온다.
그래서 HLS 스트리밍 테스트를 했는데, 잘 된다. 헐.

### Step 1. 동영상 분할을 위한 FFmpeg 4.x 설치

    $ apt-get install software-properties-common
    $ add-apt-repository ppa:jonathonf/ffmpeg-4
    $ apt install ffmpeg 
    $ ffmpeg -version
    $ apt install libfaac-dev

### Step 2. 동영상 분할

    $ ffmpeg -i sample.mp4 -map 0 -c:v libx264 -c:a aac -f ssegment -segment_list playlist.m3u8 -segment_list_flags +live -segment_time 10 out%03d.ts

또는 

    $ ffmpeg -i sample.mp4 -map 0 -preset ultrafast -c:v libx264 -c:a aac -f ssegment -segment_list playlist.m3u8 -segment_list_flags +live -segment_time 10 out%03d.ts

분할된 동영상

    $ ls -l
    out000.ts  
    out001.ts  
    out002.ts  
    out003.ts  
    out004.ts  
    out005.ts  
    playlist.m3u8  
    sample.mp4
    
심심해서 열어 본 m3m8
    
    $ cat playlist.m3u8
    #EXTM3U
    #EXT-X-VERSION:3
    #EXT-X-MEDIA-SEQUENCE:0
    #EXT-X-ALLOW-CACHE:YES
    #EXT-X-TARGETDURATION:17
    #EXTINF:16.689889,
    out000.ts
    #EXTINF:8.333333,
    out001.ts
    #EXTINF:8.333333,
    out002.ts
    #EXTINF:8.333333,
    out003.ts
    #EXTINF:8.333333,
    out004.ts
    #EXTINF:6.266667,
    out005.ts
    #EXT-X-ENDLIST
      

### Step 3. 동영상 플레이

```html
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link href="https://vjs.zencdn.net/7.6.0/video-js.css" rel="stylesheet">
</head>

<body>
    <video class="video-js vjs-big-play-centered" width="1280" height="720" data-setup='{}' controls autoplay>
        <source src="playlist.m3u8" type="application/x-mpegURL">
    </video>
    <script src='https://vjs.zencdn.net/7.6.0/video.js'></script>
</body>

</html>
```

### 참고한 링크

* https://www.bogotobogo.com/VideoStreaming/ffmpeg_http_live_streaming_hls.php
* https://www.martin-riedl.de/2018/08/24/using-ffmpeg-as-a-hls-streaming-server-part-1/


