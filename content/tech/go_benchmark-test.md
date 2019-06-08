---
title: 'Go Benchmarks'
date: 2019-06-07T23:45:41+09:00
lastmod: 2019-06-07T23:45:41+09:00
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

### Benchmarks in Go

Benchmarks are placed inside "_test.go" files

해시 알고리즘 성능을 측정하기 위한 코드 작성

`hash_test.go`

```go
package test

import (
    "crypto/md5"
    "crypto/sha1"
    "crypto/sha256"
    "crypto/sha512"
    "hash"
    "hash/fnv"
    "log"
    "math/rand"
    "testing"
)

const (
    K        = 1024
    DataSize = 1 * K
)

var data = make([]byte, DataSize)

func init() {
    _, err := rand.Read(data)
    if err != nil {
        log.Fatal(err)
    }
}

func cal(t *testing.B, h hash.Hash, n int) {
    t.ResetTimer()
    for i := 0; i < t.N; i++ {
        h.Sum(data)
    }
}

func BenchmarkFNV32(t *testing.B) {
    cal(t, fnv.New32(), DataSize)
}

func BenchmarkFNV64(t *testing.B) {
    cal(t, fnv.New64(), DataSize)
}

func BenchmarkFNV128(t *testing.B) {
    cal(t, fnv.New128(), DataSize)
}

func BenchmarkMD5(t *testing.B) {
    cal(t, md5.New(), DataSize)
}

func BenchmarkSHA1(t *testing.B) {
    cal(t, sha1.New(), DataSize)
}

func BenchmarkSHA224(t *testing.B) {
    cal(t, sha256.New224(), DataSize)
}

func BenchmarkSHA256(t *testing.B) {
    cal(t, sha256.New(), DataSize)
}

func BenchmarkSHA512(t *testing.B) {
    cal(t, sha512.New(), DataSize)
}
```

### Benchmark 실행

```
go test hash_test.go -bench .
---
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
```

- 함수명
- 실행 횟수
- 1회 소요 시간(ns, 1 sec = 10<sup>9</sup> ns)