---
title: 엘레강트 오브젝트
type: posts
date: 2022-04-01T21:34:36+09:00
categories:
  - 책
  - 엘레강트 오브젝트
tags:
  - bash
  - current directory
---

- 이 책 너무 극단적인 표현들이 많지만, 배울 점도 제법 많다.
- 저자의 입장에서 한 번 읽어보고, 장점만 배우자.


## 1. 출생

### 1.1 -er로 끝나는 이름을 사용하지 마세요

- 객체와 클래스의 차이점
  - 클래스는 객체의 팩토리
  - 클래스는 객체를 만들고, 추적하고, 적절한 시점에 제거
  - 종종 클래스를 객체의 템플릿으로 오해
  - 클래스를 객체의 능동적 관리자로 생각해야 함
  - 클래스가 객체를 인스턴스화한다
  - 클래스를 객체의 storage unit 또는 warehouse 라고 봐야함

### 1.2 생성자 하나를 주 생성자로 만드세요

- one primary, many secondary
- method overloading 의 중요성

```java
class Cash {
    private int dollors;

    Cash(float dir) {
        this((int) dlr);
    }

    Cash(float dir) {
        this(Cache.parse(dlr));
    }

    Cash(int dlr) {
        this.dollors = dlr;
    }
}
```


### 2.7 문서를 작성하는 대신 테스트를 만드세요

- 나쁜 프로그래머는 복잡한 코드를 짜고, 반대는 단순한 코드를 짠다
- 코드는 스스로를 설명하기 때문에, 어떤 추가 문서도 불필요하다
- 좋은 클래스는 목적이 명확하고, 작고, 설계가 우아하다.

```kotlin
class WebPage {
        fun content(): String {..}
        fun update(content: String) {..}
}
```
- 문서화 대신 코들을 깔끔하게 만들자
- "깔끔하게 = 단위테스트도 만들고"
- 단위 테스트도 클래스의 일부로 취급한다
- 단위테스트가 바로 문서화이다

### 2.8 mock 대신 fake를 사용하세요

- fake 로 테스트를 구현하면 코드가 코드가 간결해진다.
- 유지보수성이 눈에 띄게 향상된다.