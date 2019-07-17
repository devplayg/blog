---
title: Thymeleaf tips
draft: true
---

A list of integers:

  intList = ${ {1, 2, 3, 4} }

A list of strings:

  strList = ${ {'netgloo', 'web', 'design'} }

Usage example

    <div th:with="strList = ${ {'netgloo', 'web', 'design'} }">

      <!-- Some code using ${strList} -->
      <ul>
        <li th:each="s : ${strList}" th:text="|${s}|"></li>
      </ul>

    </div>


Locales

        <div th:text="${#locale.country}">US</div>
        <div th:text="${#locale.displayCountry}">미국</div>
        <div th:text="${#locale.toLanguageTag()}">en-US</div>
        <div th:text="${#locale.ISO3Country}">USA</div>
        <div th:text="${#locale.ISO3Language}">eng</div>
        <div th:text="${#locale.displayName}">영어 (미국)</div>
        <div th:text="${#locale.language}">en</div>
        <div th:text="${#locale.default}">ko_KR</div>
