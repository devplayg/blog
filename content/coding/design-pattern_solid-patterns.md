---
title: Design Patterns > SOLID patterns
type: post
date: 2016-11-21T00:28:15+09:00
series:
    - Design Patterns
categories:
    - coding
tags:
    - design patterns
    - 디자인 패턴
    - SOLID 패턴
---

### SOLID 패턴

- SRP (Single Responsibility)
- OCP (Open/Closed)
- LSP (Liskov Substitution)
- ISP (Interface Segregation)
- DIP (Dependency Inversion)


```kotlin
class Golang: Language {
        compile() {
            println("gopher")
        }
}

class Kotlin: Language {
        compile() {
            println("still on JVM")
        }
}

class Java: Language {
        compile() {
            println("legendary")
        }
}
```


### SRP (Single Responsibility)

- _"should be open for extension, but closed for modification"_

```
fun run(language: Language) {
        language.compile()
}
val golang = Language(GOLANG)
val kotlin = Language(KOTLIN)
val java = Language(JAVA)

run(golang)
run(kotlin)
run(java)
```

compile() function is open for extension, but closed for modification

### LSP: Liskov Substitution

``` kotlin
val golang = Language(GOLANG)
val kotlin = Language(KOTLIN)
val java = Language(JAVA)
```

### ISP (Interface Segregation)




### DIP (Dependency Inversion)

ParkingLot

