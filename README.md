# SMLDEV

- [Go](#Go)
- [PostgresSQL](#PostgreSQL)
- [Service](#service)

## Go 

- [Build Docker จาก Code][2]
- [Build แล้วเอาไป Run ใน Linux][1]

[1]:https://github.com/suteetoe/qnapsmldev#build-docker-จาก-code
[2]:https://github.com/suteetoe/qnapsmldev#build-แล้วเอาไป-run-ใน-linux

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

## PostgreSQL

- Install PostgreSQL Docker Replication
- [PostgreSQL Docker Backup](#PostgreSQL Docker Backup)

### PostgreSQL Docker Backup

```
version: '3'

services:
  postgresql-backup:
    image: smlsoft/smlpgbackup:10.4
    restart: always
    volumes:
      - ./backups:/var/lib/postgresql/backups
    environment:
      - BACKUPHOUR=22
      - BACKUPMINUTE=45
      - PGHOST=sml_postgresql
```
Option

Env | Description
--- | ---
BACKUPHOUR | เวลาที่จะทำการสำรองข้อมูล 0-23) 
BACKUPMINUTE | ระบุนาที
PGHOST | ชื่อ Server เก็บข้อมูล (postgresql)
PGPORT | Port
PGUSER | รหัสผู้ใช้
PGPASS | รหัสผ่าน

## Service

- [SMLJavaWebService](http://qnapsmldev.myqnapcloud.com:8830/service/SMLJavaWebService.war)


