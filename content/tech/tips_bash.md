---
title: Bash tips
type: posts
date: 2019-03-18T21:34:36+09:00
categories: 
  - programming language
  - bash
  - linux
  - tips
tags:
  - tips
  - bash
  - linux
  - current directory
---

### Get current directory

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    
### How to count number of files in each directory

    du -a | cut -d/ -f2 | sort | uniq -c | sort -nr 