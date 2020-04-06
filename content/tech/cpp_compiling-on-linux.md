---
title: Compiling C++ on Linux
date: 2020-03-03T00:00:00+09:00
type: posts
tags:
    - c++
    - linux
categories:
    - programming language
---

## Checking `GLIBC` version on Linux system


```bash
$ ldd --version
ldd (Ubuntu GLIBC 2.27-3ubuntu1) 2.27
```

## Hello World

hello.cpp

```cpp
#include <iostream>

int main() {
    std::cout << "Hello World\n";
}
```

```cpp
$ g++ -o hello hello.cpp && ./hello
Hello World
```

Hello World with namespace

```c++
#include <iostream>

using namespace std;

int main(void) {
    cout << "Hello World\n";
    return 0;
}
```

```
$ g++ -o hello hello_namespace.cpp && ./hello
Hello World
```
