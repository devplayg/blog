---
title: "Bash tips"
date: 2019-03-18T21:34:36+09:00
lastmod: 2019-03-18T21:34:36+09:00
tags : [ "bash", "tips", "shell", "sh", "tips"]
categories : [ "tech" ]
layout: post
type:  "post"
draft: false
---

## Get current directory


```bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```