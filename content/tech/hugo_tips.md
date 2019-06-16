---
title: 'Hugo Tips'
date: 2019-06-16T14:21:11+09:00
categories:
    - util
    - hugo
tags:
    - Hugo 링크
    - Hugo link
    - 블로그
    - 블로그 hugo
types: posts
---

### 링크와 참조
    
    {{</* ref "document.md" */>}}
    {{</* ref "#anchor" */>}}
    {{</* ref "document.md#anchor" */>}}
    {{</* ref "/blog/my-post" */>}}
    {{</* ref "/blog/my-post.md" */>}}
    {{</* relref "document.md" */>}}
    {{</* relref "#anchor" */>}}
    {{</* relref "document.md#anchor" */>}}
    
    
### 블로그 시작

    git clone git@github.com:devplayg/blog.git
    cd blog
    git submodule init
    git submodule update