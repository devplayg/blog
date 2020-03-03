---
title: Compiling C++ on Linux
---

Check `GLIBC` version on Linux system

Hello World

```bash
$ ldd --version
ldd (Ubuntu GLIBC 2.27-3ubuntu1) 2.27
```


Hello World with Namespace

```c++
#include <iostream>

int main() {
    std::cout << "Hello World\n";
}
```
```bash
$ g++ -o hello hello.cpp && ./hello
Hello World
```

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
