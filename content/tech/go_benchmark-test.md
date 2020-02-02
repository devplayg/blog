---
title: 'Benchmarks with Go'
date: 2019-06-07T23:45:41+09:00
lastmod: 2020-021-01T23:45:41+09:00
categories: 
    - programming language
    - go
tags: 
    - test
    - benchmark
    - hash
    - algorithm
    - go
type: posts
---

### Benchmark test in Go


`hash_test.go`

<script src="https://gist.github.com/devplayg/6fcf1f7dc69befe33bde5519f38dd3c6.js"></script>

### Run code

```
go test hash_test.go -bench .
```

Result

    goos: windows
    goarch: amd64
    BenchmarkFNV32-8         3000000               415 ns/op
    BenchmarkFNV64-8         3000000               426 ns/op
    BenchmarkFNV128-8        3000000               428 ns/op
    BenchmarkMD5-8           2000000               589 ns/op
    BenchmarkSHA1-8          2000000               708 ns/op
    BenchmarkSHA224-8        2000000               883 ns/op
    BenchmarkSHA256-8        2000000               854 ns/op
    BenchmarkSHA512-8        2000000               991 ns/op
    PASS
    ok      command-line-arguments  17.893s
