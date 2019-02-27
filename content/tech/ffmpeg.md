---
title: "ffmpeg"
date: 2019-01-22T00:09:12+09:00
draft: false
---

# 여러개의 동영상 합치기

ffmpeg -f concat -i "파일목록" -c copy "결과파일"

```
ffmpeg -f concat -i list.txt -c copy output.mp4
```

파일목록 형식
```
file 1.mp4
file 2.mp4
file 3.mp4
file 4.mp4
```
