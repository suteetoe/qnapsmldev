# SMLDEV

- [Go](#Go)
- [Service](#service)


## Go
### build Go DockerFile with Multi-state

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


## Service

- [SMLJavaWebService](http://qnapsmldev.myqnapcloud.com:8830/service/SMLJavaWebService.war)


