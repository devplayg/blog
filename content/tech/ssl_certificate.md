---
title: SSL 
draft: true
---

# 용어

SSL(Secure Sockets Layer)
- 웹서버와 웹브라우저 사이의 보안을 위해 만들어진 프로토콜
- Netscape 사에서 개발
TLS(Transport Layer Security)
CA(Certificate Authority)
- 인증기관

OpenSSL로 만드는 SSL 인증서

전송 계층 보안 (영어: Transport Layer Security, TLS, 과거 명칭: 보안 소켓 레이어/Secure Sockets Layer, SSL)[1]는 컴퓨터 네트워크에 통신 보안을 제공하기 위해 설계된 암호 규약이다. 그리고 '트랜스포트 레이어 보안'이라는 이름은 '보안 소켓 레이어'가 표준화 되면서 바뀐 이름이다. 이 규약은 인터넷 같이 TCP/IP 네트워크를 사용하는 통신에 적용되며, 통신 과정에서 전송계층 종단간 보안과 데이터 무결성을 확보해준다. 이 규약은 웹 브라우징, 전자 메일, 인스턴트 메신저, voice-over-IP (VoIP) 같은 응용 부분에 적용되고 있다. 국제 인터넷 표준화 기구(IETF)에 의해 현재 구식(deprecate)으로 간주되어 있다.[2] 최종 갱신은 RFC 5246이고, 최종 갱신 버전은 넷스케이프에서 만든 SSL 표준을 바탕으로 했다.


# SSL 인증서

마스크(상품) = 데이터
인증마크 = 인증서
판매자 = 데이터 제공자
구매자
판매자에게 있는 QR코드 생성도구 = OpenSSL
구매자가 사용하는 프로그램 = 웹브라우저

데이터(상품) = 마스크
데이터 = 박스
공개키 = 박스를 잠글 수 있는 열쇠
판매자 비밀번호 = 박스를 열 수 있는 열쇠


## 개인키 발급

- 박스를 잠글 수 있는 열쇠
- 하지만, 이 열쇠로 박스를 열 수 없다는 것은 함정
- 집문서, 땅문서, 몰래통장 하고 같이 보관해야 함
- 공개되면 인생 끝이라고 보면 됨
- `private.key` 가 만들어짐

     openssl genrsa -out private.key 2048

### 공개키 발급

- 내 박스를 열 수 있는 열쇠
- 하지만, 창고를 다시 잠글 수 없다는 것은 함정
- 개인키를 가지고 있어야 공개키를 만들 수 있음
- 아무나 다 복사해줘도 됨
- public.key` 가 만들어짐

     openssl rsa -in private.key -out public.key -pubout


## CSR( 인증요청서 ) 만들기

- 이왕 만든 열쇠, 공증기관에 보내서 공증이나 받고자 요청편지을 작성함
- 그 편지이 CSR, 즉 인증요청서임
- 이름, 지역, 편지, 집주소(도메인), 국가 등의 정보가 필요함
- certificate.csr 가 만들어짐

    openssl req -new -key private.key -out certificate.csr -subj "/C=KR/ST=Gyunggi-do/L=Pangyo/O=DevPlayG/OU=Playground/CN=devplayg.com"

https://www.rootca.or.kr/kcac/down/TechSpec/1.3-KCAC.TS.DN.pdf

- 요청서 이매일 보기

    openssl  req  -text  -in certificate.csr


## CRT( 인증서 ) 만들기

- 드디어 인증서 만들기
- 그런데 작성한 요청 편지에 도장(인증)을 찍어줄 공증 기관이 없네.
- 그냥 내가 내 인감도장을 요청편지에 찍자.
- 내 키(private.key) 가져와.
- 드디어 certificate.crt 가 만들어짐

    openssl x509 -req -days 365 -in certificate.csr -signkey private.key  -out certificate.crt

- 인증서 보기

     openssl  x509  -text  -in certificate.crt  -noout

- Groovy Everywhere, JYP, Gray



## 암호화 테스트

공개키로 박스를 잠그고, 개인키로 박스를 열어보기

    $ echo "Actually, I stole something." > data.txt
    $ cat data.txt
    Actually, I stole something.

        openssl rsautl -encrypt -inkey public.key -pubin -in data.txt -out data.locked

    $ cat data.locked
    �1�K ↑���i↓�9�Δ[*�'�v A�Z↔�♠dQJ�☼)=�e��������JR§j♦�↨��z�:�▼���♀�j֪y=:���Az-
    ��fL☼'X�-♂4+L�E*ίn�\u���#��,♀%9U�♦�♀,�툞a�X_��♥‼�#\��?�→5↔�P��]r.↑↕☼�/0�9���pX#�{
    n§����∟�� 0��j֫�K☺RaG5∟̩Q���9�


    풀어보기

        $ openssl rsautl -decrypt -inkey private.key -in data.locked -out data.unlocked
        $ cat data.unlocked
        Actually, I stole something.


## signing

1)
    $ openssl rsautl -sign -inkey private.key -out data.signed -in data.txt
    $ openssl rsautl -verify -inkey public.key -in data.signed -pubin
    $ openssl rsautl -verify -inkey public.key -in data.signed -pubin -out data.signed.verified

2)
    $ openssl dgst -sha256 -sign private.key -out data.signed data.txt
    $ openssl dgst -sha256 -verify public.key -signature data.signed data.txt
    Verified OK




## 인증서에서 공개키 보기
    openssl x509 -pubkey -noout -in certificate.crt

## 인증요청서에서 공개키 보기

    openssl req -in certificate.csr -noout -pubkey


## 인증서 포맷 변경

PEM -> DER 변환
# openssl  x509  -inform  PEM  -in <PEM 인증서>  -outform DER  -out <결과 DER 인증서>
# openssl  x509  -inform  PEM  -in certificate.crt  -outform DER  -out certificate.crt_to_der

DER -> PEM 변환
# openssl  x509  -inform  DER  -in <DER 인증서>  -outform PEM  -out <결과 PEM 인증서>
# openssl  x509  -inform  DER  -in certificate.crt_to_der  -outform PEM  -out certificate.der_to_crt

PEM -> PKCS#12(PFX) 변환
# openssl  pkcs12  -export    -inkey  <개인키>  -in <PEM 인증서>  -out  <pfx 인증서>
# openssl  pkcs12  -export    -inkey  private.key  -in certificate.crt  -out  certificate.crt_to_pfx

PKCS#12 (PFX) -> PEM 변환
# openssl  pkcs12  -in <pfx 인증서>  -out  <PEM 인증서>  -nodes
# openssl  pkcs12  -in certificate.crt_to_pfx  -out  certificate.pfx_to_crt  -nodes




※ 공개키 알고리즘은 공개키로 암호화를 하냐, 개인키로 암호화를 하냐에 따라 사용분야가 달라짐-> 공개키의 경우 데이터 보안에 중점을 두고, 개인키로 암호화하면 인증 과정에 중점을 두는 것!

1. 공개키로 암호화를 하는 경우: 상대방의 공개키로 데이터를 암호화하고 데이터를 전달하면, 데이터를 받은 사람은(공개키 주인) 자신의 개인키로 데이터를 복호화 한다.

ex) A키로 암호화를 한다면, B키로 복호화가 가능하고, B키로 암호화를 한다면, A키로 복호화가 가능한 것이다.



2. 개인키로 암호화를 하는 경우: 개인키의 소유자가 개인키로 데이터를 암호화하고 공개키와 함께 전달. 이 과정에서 공개키와 데이터를 획득한 사람은 송신자의 공개키로 복호화가 가능함! 암호화된 데이터가 공개키로 복호화 된다는 것은 공개키와 쌍을 이루는 개인키에 의하여 암호화되었다는 것을 의미! 즉 데이터의 제공자의 신원 확인이 보장된다는것! 이 방법으로 공인인증체계의 기본바탕인 전자서명. 개인키 암호화를 전자서명이라 부름!





## 한방에

openssl req -new -x509 -days 365 -sha256 -newkey rsa:2048 -nodes -keyout "server.key" -out "server.crt" -subj "/emailAddress=admin@devplayg.com/CN=125.132.191.38/OU=Cert/O=Devplayg/L=Pangyo/ST=Sungnam/C=KR"



openssl pkcs8 -topk8 -nocrypt -in privcate.key -out server.pem
    openssl pkcs8 -topk8 -nocrypt -in key.pem -out server.pem

https://blog.hangadac.com/2017/07/31/%ED%99%88%EC%84%9C%EB%B2%84-%EA%B5%AC%EC%B6%95%EA%B8%B0-ssl-%EC%9D%B8%EC%A6%9D%EC%84%9C-%EB%A7%8C%EB%93%A4%EA%B8%B0-%EC%97%B0%EC%8A%B5/

https://namjackson.tistory.com/24


https://opentutorials.org/course/228/4894


https://gist.github.com/dreikanter/c7e85598664901afae03fedff308736b
https://brunch.co.kr/@artiveloper/24

