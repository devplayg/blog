---
title: 'Spring Boot 용어 - Servlet & Servlet Container'
type: posts
date: 2019-06-09T16:11:23+09:00
lastmod: 2019-07-25T00:00:00+09:00
categories: 
    - programming language
    - spring framework 
tags: 
    - java
    - spring framework
    - spring
    - spring boot
---

### 서블릿(Servlet)

* 서블릿은 Java 클래스이다.
* 서블릿은 [요청-응답 모델]를 처리하기 위해 만들어진 Java Server 의 기능을 확장하는데 사용되는 Java 클래스이다
* 서블릿은 클라이언트의 요청을 받고, 그 처리 결과를 다시 클라이언트에 전달한다.
* 서블릿은 다양한 요청방식에 응답할 수 있지만, 일반적으로 웹서버에 호스트 되어 있는 응용프로그램을 확장하는데 사용된다. 
* 클라이언트가 서블릿에 요청을 보내면, 서블릿은 요청을 처리한 후 응답을 클라이언트에 돌려준다.
    - 요청: 클라이언트 => 서블릿
    - 응답: 서블릿 => 클라이언트   
* 예
    - 사용자가 웹브라우저에서 "주문" 버튼을 클릭하면
    - 웹브라우저는 이 주문 요청을 웹서버에 보내고
    - 웹서버는 서블릿에 그 요청을 전달한다.
    - 서블릿은 받은 요청을 처리한 하고, 그 응답을 웹서버로 돌려주고,
    - 웹서버는 서블릿으로부터 받은 응답을 사용자 웹브라우저에 전달한다.
    - 사용자는 웹브라우저에서 "주문완료" 문구를 볼 수 있다.
    
    ```
    A사용자 [주문] 클릭 ==> 웹서버 ==> [Servlet-A]
    B사용자 [주문] 클릭 ==> 웹서버 ==> [Servlet-B]
    B사용자 [주문] 클릭 ==> 웹서버 ==> [Servlet-C]
    ```

### 서블릿 컨테이너(Servlet Container)

* 서블릿 컨테이너는은 웹서버의 한 부분이다.
* 서블릿 컨테이너는 여러 서블릿들을 담는 통이다.
* 그래서 서블릿 컨테이너 안에는 여러개의 서블릿들이 들어있을 수 있다.
* 서블릿 컨테이너는 그 안에 있는 여러 서블릿들을 관리해야 한다.
* 예를 들면
    - 만약, 동시에 사용자 A, B, C가 동시에 주문 버튼을 클릭했다면,
    - A가 요청했을 때 만들어진 서블릿-A는 A의 요청만 처리해야 한다.
    - B가 요청했을 때 만들어진 서블릿-B는 B의 요청만 처리해야 한다.
    - C가 요청했을 때 만들어진 서블릿-C는 B의 요청만 처리해야 한다.
    - 그런데, 혹시라도 A가 요청했을 때 만들어진 Servlet-A가 C의 요청을 처리하면 문제가 발생할 수 있다.
* 그래서 서블릿 컨테이너는 각각의 요청에 대응하는 서블릿들을 관리할 책임을 가지고 있다. 그 책임들 중 몇 가지는 아래와 같다.
    - Life Cycle Management (서블릿이 언제 만들어졌고, 처리하는데 얼마나 걸렸고, 언제 완료 했는지)
    - Multithreaded support (다수의 요청을 효율적으로 병렬 혹은 병렬같은 방식으로 )
    - Object Pooling (미리 다수의 요청을 받을 수 있으므로, 미리 서블릿을 만들어 놓는 기술)
    - Security etc. (A, B, C의 요청을 각각 구분할 수 있는 기술)
* 서블릿 컨테이너에는 "Apache Tomcat"이 있다.


### 참고

https://docs.oracle.com/javaee/7/tutorial/servlets001.htm#BNAFE

### PreAuthorize not working on Controller

https://stackoverflow.com/questions/32442408/preauthorize-not-working-on-controller/35759965

A common problem with using PrePost annotations on controllers is that Spring method security is based on Spring AOP, which is by default implemented with JDK proxies.
That means that it works fine on the service layer which is injected in controller layer as interfaces, but it is ignored on controller layer because controller generally do not implement interfaces.
The following is just my opinion:

* prefered way: move the pre post annotation on service layer
* if you cannot (or do not want to), try to have your controller implement an interface containing all the annotated methods
* as a last way, use proxy-target-class=true
