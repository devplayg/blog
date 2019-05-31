
# Multiple return

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
