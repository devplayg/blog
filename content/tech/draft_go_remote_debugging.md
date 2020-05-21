Golang 원격 디버깅

* 개발은 PC에서
* 실행은 Server에서


On PC

1) Goland 에서 [Run] - [Run] - [Edit configuration]



On Server



1) delve 라이브러리 설치
https://github.com/go-delve/delve

    go get github.com/go-delve/delve/cmd/dlv
    cd $GOPATH/src/github.com/go-delve/delve
    make install


2) 소스 컴파일

    $ cd $GOPATH/src/github.com/devplayg/goback/cmd/goback
    $ go build -gcflags "all=-N -l"

2) 바이너리 실행

    $ dlv --listen=:2345 --headless=true --api-version=2 --accept-multiclient exec ./goback


On PC

    디버깅 실행
    
    
    
