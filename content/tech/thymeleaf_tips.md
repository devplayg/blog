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
