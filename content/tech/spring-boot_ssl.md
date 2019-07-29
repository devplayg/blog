---
title: 'Spring Boot, SSL 인증서 만들기
draft: true
categories
tags:
- java
- rsa
- cert
- keytool
- Spring Boot
- SSL
- 인증서
---

### Key store 생성

    $ keytool -genkey -v -keystore sb201.key -alias sb201 -keyalg RSA -keysize 2048 -validity 3650
    Enter keystore password:
    Re-enter new password:
    What is your first and last name?
      [Unknown]:  iot
    What is the name of your organizational unit?
      [Unknown]:  devplayg
    What is the name of your organization?
      [Unknown]:  devplayg
    What is the name of your City or Locality?
      [Unknown]:  pangyo
    What is the name of your State or Province?
      [Unknown]:  seoungnam
    What is the two-letter country code for this unit?
      [Unknown]:  ko
    Is CN=iot, OU=devplayg, O=devplayg, L=pangyo, ST=seoungnam, C=ko correct?
      [no]:  y

    Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 3,650 days
            for: CN=iot, OU=devplayg, O=devplayg, L=pangyo, ST=seoungnam, C=ko
    [Storing sb201.key]


### 인증서 생성

    $ keytool -export -alias sb201 -storepass devplayg -file sb201.cer -keystore sb201.key
    Certificate stored in file <sb201.cer>


### Trust-Store 생성하기

    $ keytool -import -alias sb201 -file sb201.cer -keystore sb201.ts -storepass devplayg
    Owner: CN=iot, OU=devplayg, O=devplayg, L=pangyo, ST=seoungnam, C=ko
    Issuer: CN=iot, OU=devplayg, O=devplayg, L=pangyo, ST=seoungnam, C=ko
    Serial number: 24592ccb
    Valid from: Mon Jul 29 15:52:57 KST 2019 until: Thu Jul 26 15:52:57 KST 2029
    Certificate fingerprints:
             SHA1: EB:19:8F:90:4E:59:8D:F9:2F:05:EB:46:A5:BD:2D:C1:5B:2F:7F:A9
             SHA256: 37:20:7B:7C:75:35:CA:4F:18:25:84:91:94:57:2A:42:04:51:E4:2B:F6:99:0B:17:8A:25:E8:9D:4C:59:C1:A7
    Signature algorithm name: SHA256withRSA
    Subject Public Key Algorithm: 2048-bit RSA key
    Version: 3

    Extensions:

    #1: ObjectId: 2.5.29.14 Criticality=false
    SubjectKeyIdentifier [
    KeyIdentifier [
    0000: 4E 90 11 C6 F0 15 BF 8E   F1 42 4C 85 E5 68 82 6B  N........BL..h.k
    0010: 81 DD EE 19                                        ....
    ]
    ]

    Trust this certificate? [no]:  yes
    Certificate was added to keystore


    $ ls -l
    sb201.cer
    sb201.key
    sb201.ts


### Application.yaml 수정

server:
  port: 8090 #Https port
  ssl:
    enabled: true
    key-store: key파일 절대경로
    key-store-password: Key-store 비밀번호
    key-password: Key-store 비밀번호
    key-alias: Aliase
    trust-store: Trust-Store 절대경로
    trust-store-password: Trust-Store 비밀번호
