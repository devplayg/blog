---
title: Design Patterns > SOLID patterns
type: posts
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

- SR: Single Responsibility
- OC: Open/Closed
- LS: Liskov Substitution
- IS: Interface Segregation
- DI: Dependency Inversion


### Single Responsibility(SRP)

- _"should be open for extension, but closed for modification"_


```kotlin
interface Language {
        run()
}

class Golang: Language {
        run() {
            println("gopher")
        }
}

class Kotlin: Language {
        run() {
            println("still on JVM")
        }
}

class Javascript: Language {
        run() {
            println("legendary")
        }
}

fun run(language: Language) {
        language.run()
}

val golang = Language(GOLANG)
val kotlin = Language(KOTLIN)
val javascript = Language(JAVASCRIPT)

golang.run()
kotlin.run()
javascript.run()
```