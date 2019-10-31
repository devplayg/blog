---
title: 'Hugo tips'
types: posts
date: 2019-06-16T14:21:11+09:00
categories:
    - util
    - tips
tags:
    - hugo link
    - hugo
    - blog
---

### Link
    
    {{</* ref "document.md" */>}}
    {{</* ref "#anchor" */>}}
    {{</* ref "document.md#anchor" */>}}
    {{</* ref "/blog/my-post" */>}}
    {{</* ref "/blog/my-post.md" */>}}
    {{</* relref "document.md" */>}}
    {{</* relref "#anchor" */>}}
    {{</* relref "document.md#anchor" */>}}
    
    
### Get started

    git clone git@github.com:devplayg/blog.git
    cd blog
    git submodule init
    git submodule update