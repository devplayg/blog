
## Multiple return [#](https://play.golang.org/p/W46sTgkJmyM)

```go
package main

func main() {
	food1, food2 := giveMeSomeFood()
	println(food1)
	println(food2)
}

func giveMeSomeFood() (string, string) {
	return "banana", "grape"
}
```

## Error handling

The error type is an interface type. An error variable represents any value that can describe itself as a string. 

```go
type error interface {
    Error() string
}
```

```go
f, err := os.Open("filename.ext")
if err != nil {
    log.Fatal(err)
}
```
