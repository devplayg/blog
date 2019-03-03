---
date: 2019-01-22T00:09:12+09:00
title: ffmpeg Command
categories: [ "util", "ffmpeg" ]
tags: [ "util", "ffmpeg" ]
---

**여러개의 동영상 합치기**

	ffmpeg -f concat -i "파일목록" -c copy "결과파일"
	ffmpeg -f concat -i list.txt -c copy output.mp4

**list.txt**

	/tmp/file1.mp4
	/tmp/file2.mp4
	/tmp/file3.mp4
	/tmp/file4.mp4

