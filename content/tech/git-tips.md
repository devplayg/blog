---
title: "Find and restore deleted files in a Git repository"
date: 2019-03-25T19:46:39+09:00
lastmod: 2019-03-25T19:46:39+09:00
tags : [ "git", "recover", "tip"]
categories : [ "tech" ]
layout: post
type:  "post"
highlight: true
draft: false
---

## Find deleted files in a Git repository 

```
git ls-files -d 
```

## Recover deleted files in a Git repository 

```
git ls-files -d | xargs git checkout --
```