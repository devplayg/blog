---
title: 'MozJPEG 를 활용한 JPEG 압축 테스트 결과'
series:
    - 'MozJPEG 를 활용한 JPEG 압축'
date: 2019-06-16T14:25:34+09:00
categories: 
  - util
tags: 
  - jpeg 압축
  - 이미지 압축
  - jpeg 크키 줄이기
  - ubuntu
  - imgpresso
  - imagemagic
type: posts
---

### MozJPEG를 활용한 이미지 압축 테스트 결과
 

| 압축 출처(라이브러리) | 용량(Bytes) | 품질(1~100) | 공간절약비율 | 다운로드 링크                                                                     |
|-----------------------|-----------|-------------|--------------|----------------------------------------------------------------------------|
| **원본**              | 1,030,997 | -           | 0 %          | [my-image.jpg](my-image.jpg)                             |
| MozJPEG               | 989,923   | 100         | 4 %          | [my-image_cjpeg-100.jpg](my-image_cjpeg-100.jpg)         |
| ImageMagic            | 941,883   | 기본        | 9 %          | [my-image_perl.jpg](my-image_perl.jpg)                   |
| Google Guetzli        | 425,256   | 84          | 59 %         | [my-image_google.jpg](my-image_google.jpg)               |
| TinyJPEG              | 374,566   | 기본        | 64 %         | [my-image-tinyjpeg.jpg](my-image-tinyjpeg.jpg)           |
| MozJPEG               | 338,452   | 90          | 67 %         | [my-image_cjpeg-90.jpg](my-image_cjpeg-90.jpg)           |
| Compressor.io         | 268,780   | 기본        | 74 %         | [my-image-compressor.io.jpg](my-image-compressor.io.jpg) |
| MozJPEG               | 215,319   | 80          | 79 %         | [my-image_cjpeg-80.jpg](my-image_cjpeg-80.jpg)           |
| **MozJPEG**           | 207,723   | 기본        | 80 %         | [my-image_cjpeg-default.jpg](my-image_cjpeg-default.jpg) |
| ImgPresso             | 192,394   | Very High   | 81 %         | [my-image_imgpresso.jpg](my-image_imgpresso.jpg)         |
| **MozJPEG**           | 156,782   | 70          | 85 %         | [my-image_cjpeg-70.jpg](my-image_cjpeg-70.jpg)           |
| MozJPEG               | 129,378   | 60          | 87 %         | [my-image_cjpeg-60.jpg](my-image_cjpeg-60.jpg)           |
| MozJPEG               | 110,646   | 50          | 89 %         | [my-image_cjpeg-50.jpg](my-image_cjpeg-50.jpg)           |
| MozJPEG               | 93,594    | 40          | 91 %         | [my-image_cjpeg-40.jpg](my-image_cjpeg-40.jpg)           |
| MozJPEG               | 73,283    | 30          | 93 %         | [my-image_cjpeg-30.jpg](my-image_cjpeg-30.jpg)           |
| MozJPEG               | 51,743    | 20          | 95 %         | [my-image_cjpeg-20.jpg](my-image_cjpeg-20.jpg)           |
| MozJPEG               | 27,813    | 10          | 97 %         | [my-image_cjpeg-10.jpg](my-image_cjpeg-10.jpg)           |

[MozJPEG](https://github.com/mozilla/mozjpeg) 추천

라이선스: [BSD-style open source licenses](https://github.com/mozilla/mozjpeg/blob/master/LICENSE.md)


### 비교

원본

![원본](my-image.jpg)

MozJPEG (150 KB, Quality 70

![MozJPEG (150 KB, Quality 70)](my-image_cjpeg-70.jpg)
