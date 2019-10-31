---
title: 'Openssl, ROOT CA 인증서 생성'
date: 2019-08-09T00:00:00+09:00
type: posts
categories:
  - 인증서
  - tips
  - command-line
tags:
  - openssl
  - rsa
  - 인증서
---

### CA가 사용할 RSA Key 생성

암호가 불필요한 경우

    openssl genrsa -out private.key 2048

암호를 설정할 경우

    openssl genrsa -aes256 -out private.key 2048

### 인증성 생성

    openssl req -new -key private.key -out certificate.csr -subj "/C=KR/ST=Seoul/L=Pangyo/O=devplayg/OU=playground/CN=devplayg.com"

### Self-signed 인증서 생성

    openssl x509 -req -days 3650 -extensions v3_ca -set_serial 1 -in certificate.csr -signkey private.key -out certificate.crt 

### 인증서 확인

    openssl x509 -text -in certificate.crt
