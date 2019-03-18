---
title: "Go - Interface as Parameter to Function"
date: 2019-03-19T03:06:29+09:00
lastmod: 2019-03-19T03:06:29+09:00
tags : [ "go", "golang", "tips", "interface" ]
categories : [ "tech" ]
layout: post
type:  "post"
draft: false
---

### Heading 3

```
func OpenVideoCapture(v interface{}) (*VideoCapture, error) {
    switch vv := v.(type) {
    case int:
        return VideoCaptureDevice(vv)
    case string:
        id, err := strconv.Atoi(vv)
        if err == nil {
            return VideoCaptureDevice(id)
        }
        return VideoCaptureFile(vv)
    default:
        return nil, errors.New("argument must be int or string")
    }
}
```