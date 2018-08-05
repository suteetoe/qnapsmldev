# SMLDEV

[Go](#Go)
[Service](#service)

## Go 

Build Docker จาก Code
Build แล้วเอาไป Run ใน Linux

### Build Docker จาก Code

```
FROM golang:1.10.3 as builder

WORKDIR /go/src/app
COPY . .
ADD . /go/src/goproject/

# install dependency
RUN go get -d -v ./...
# build go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
# CMD ["app"] # if not step2 

# Setp 2 move to scratch
FROM alpine:latest

COPY --from=builder /go/src/app/app /
CMD ["/app"]

EXPOSE 80
```

### Build แล้วเอาไป Run ใน Linux

สั่ง Build ด้วย Command 
```
$ CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
```
จะได้ app เอาไป run ใน linux

สร้าง Dockerfile สำหรับ เอาไป run ใน Linux

```
FROM scratch

ADD app /
CMD ["/app"]
EXPOSE 80
```
สั่ง build dockerfile

```
docker build -t <ชื่อ Image> .
```

```
docker run --name <ชื่อ Container> -p <port ข้างนอก>:<Port ใน image> -d <ชื่อ Image>
```

ตัวอย่าง

```
docker run --name <ชื่อ Container> -d -p 80:80
```


## Service

- [SMLJavaWebService](http://qnapsmldev.myqnapcloud.com:8830/service/SMLJavaWebService.war)


