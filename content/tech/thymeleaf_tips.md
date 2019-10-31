---
title: 'Thymeleaf tips'
type: posts
date: 2019-07-25T00:00:00+09:00
categories: 
  - template engine
  - spring boot
  - template engine
  - tips
tags:
  - spring boot
  - thymeleaf
---

### A list of integers:

    intList = ${ {1, 2, 3, 4} }

### A list of strings:

    strList = ${ {'netgloo', 'web', 'design'} }
    <div th:with="strList = ${ {'netgloo', 'web', 'design'} }">
        <ul>
            <li th:each="s : ${strList}" th:text="|${s}|"></li>
        </ul>
    </div>

### Locales

        <div th:text="${#locale.country}">US</div>
        <div th:text="${#locale.displayCountry}">미국</div>
        <div th:text="${#locale.toLanguageTag()}">en-US</div>
        <div th:text="${#locale.ISO3Country}">USA</div>
        <div th:text="${#locale.ISO3Language}">eng</div>
        <div th:text="${#locale.displayName}">영어 (미국)</div>
        <div th:text="${#locale.language}">en</div>
        <div th:text="${#locale.default}">ko_KR</div>

### Access "Application.yaml"

    <span th:text="${@environment.getProperty('app.company')}"></span>
