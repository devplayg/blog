---
title: 'CURL tips'
date: 2019-08-19T00:00:00+09:00
type: posts
categories:
    - util
    - command-line
tags:
    - CURL
    - post
    - get
    
---

### 파일 전송

    curl -F "file=@nssm.exe" http://127.0.0.1/filestorage/uploadFile

### 여러 파일 전송

    curl -F "files=@nssm.exe" -F "files=@c.txt" http://127.0.0.1/filestorage/uploadMultipleFiles
    curl -F "files[]=@nssm.exe" -F "files[]=@c.txt" http://127.0.0.1/filestorage/uploadMultipleFiles

#### 파일과 파라메터 전송

    curl -F "files=@nssm.exe" -F "event_type=3" http://127.0.0.1/filestorage/uploadMultipleFiles
    curl -F "file=@nssm.exe" -F "event_type=3" -F "cameraId=109" -F "date=2019-01-02 12:34:56" http://127.0.0.1/filestorage/uploadFile2