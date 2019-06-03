```go
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
