---
title: 'Java Lambda'
type: posts
date: 2019-07-25T00:00:00+09:00
categories: 
    - programming language
    - java
tags: 
    - java
    - lambda
---

Before using lamda

```java
Collections.sort(logs, new Comparator<FaceRecognition>() {
    @Override
    public int compare(FaceRecognition o1, FaceRecognition o2) {
        Float f1 = o1.getScore();
        Float f2 = o2.getScore();
        return f2.compareTo(f1);
    }
});
```

After using lamda
    
```java
Collections.sort(logs, (o1, o2) -> {
   Float f1 = o1.getScore();
   Float f2 = o2.getScore();
   return f2.compareTo(f1);
});
```