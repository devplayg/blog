---
title: 'Spring Boot, SSL 인증서 만들기'
type: posts
date: 2019-08-02T22:00:00+09:00
categories:
    - spring boot
    - ssl
tags:
    - java
    - rsa
    - cert
    - keytool
    - Spring Boot
    - SSL
    - 인증서
---


### Step 1. Key store 생성

비밀번호: devplayg

    keytool -genkey -v -keystore sb201.key -alias sb201 -keyalg RSA -keysize 2048 -validity 3650


### Step 2. 인증서 생성

    keytool -export -alias sb201 -storepass devplayg -file sb201.cer -keystore sb201.key


### Step 3. Trust-Store 생성

    keytool -import -alias sb201 -file sb201.cer -keystore sb201.ts -storepass devplayg

### Step 4. 생성된 파일들 확인 및 Spring Boot 설정
    
    $ ls -l
    sb201.key
    sb201.cer
    sb201.ts

Application.yaml 수정

    server:
      port: 443
      ssl:
        enabled: true
        key-store: #key파일 절대경로#
        key-store-password: #Key-store 비밀번호#
        key-password: #Key-store 비밀번호#
        key-alias: #Aliase#
        trust-store: #Trust-Store 절대경로#
        trust-store-password: #Trust-Store 비밀번호#
        
### 참고

* [CONVERT PRIVATE SSL KEY FROM JKS TO PEM FORMAT](https://cinhtau.net/2016/08/09/convert-private-ssl-key-from-jks-to-pem-format/)
        
    ```
    keytool -importkeystore -srckeystore sb201.key -destkeystore sb201.p12 -deststoretype PKCS12
    openssl pkcs12 -in sb201.p12 -out sb201.pem
    ```
 