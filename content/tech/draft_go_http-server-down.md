---
title: How to shutdown HTTP server in Go
date: 2020-05-24T09:00:04+09:00
type: posts
categories:
  - programming language
tags:
  - go
  - http
---

https://golang.org/pkg/net/http/#pkg-examples

```go
package main

import (
    "context"
    "log"
    "net/http"
    "os"
    "os/signal"
)

func main() {
    var srv http.Server

    idleConnsClosed := make(chan struct{})
    go func() {
        sigint := make(chan os.Signal, 1)
        signal.Notify(sigint, os.Interrupt)
        <-sigint

        // We received an interrupt signal, shut down.
        if err := srv.Shutdown(context.Background()); err != nil {
            // Error from closing listeners, or context timeout:
            log.Printf("HTTP server Shutdown: %v", err)
        }
        close(idleConnsClosed)
    }()

    if err := srv.ListenAndServe(); err != http.ErrServerClosed {
        // Error starting or closing listener:
        log.Fatalf("HTTP server ListenAndServe: %v", err)
    }

    <-idleConnsClosed
}
```
