---
title: "Pseudo-random permutation of the integers in Go"
date: "2019-06-05T21:34:36+09:00"
categories: 
    - tech
    - golang
tags: 
    - golang
    - random
---
    
```
package main

import (
    "fmt"
    "math/rand"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    p := rand.Perm(100)
    for _, r := range p[:10] {
        fmt.Println(r)
    }
}
```