---
title: Bash tips
date: 2019-03-18T21:34:36+09:00
categories: 
  - programming language
  - bash
  - linux
tags:
  - tips
  - bash
  - linux
  - current directory
type: posts
---

### Get current directory

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"