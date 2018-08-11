# SMLDEV

- [Go](#Go)
- [PostgresSQL](#postgresql)
- [Service](#service)
- [Install](#install)

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
- [Postgresql Backup Command](#postgresql-backup-command)
- [Postgresql Restore Command](#postgresql-restore-command)
- [Install PostgreSQL Docker Replication](#install-postgresql-with-replication)
- [PostgreSQL Docker Backup](#postgresql-docker-backup)

### PostgreSQL Backup Command
```
pg_dump --host <ip> --port <port> --username "postgres" --format custom --blobs --verbose --file "<backuptofilename>" <databasename>
```

OR Linux

```
pg_dump -Fc <databasename> > outputfilename
```

### PostgreSQL Restore Command
```
pg_restore.exe --host <ip> --port <port> --username "postgres" --dbname <database_name> --verbose <backupfile>
```
OR Linux
```
pg_restore --dbname <database_name> --verbose <backupfile>
```

### Install PostgreSQL With Replication

```
version: '3'

services:
 postgresql-master:
  image: docker.smldatacenter.com:5443/postgresql:10.4-replication
  container_name: postgresql_master
  restart: always
  environment:
   - POSTGRES_PASSWORD=<password>
  volumes:
   - ./master_data:/var/lib/postgresql/data
  ports:
   - 5432:5432
 postgresql-slave1:
  image: docker.smldatacenter.com:5443/postgresql:10.4-replication
  restart: always
  environment:
   - POSTGRES_MASTER_SERVICE_HOST=postgresql_master
   - REPLICATION_ROLE=slave
  volumes:
   - ./slave1_data:/var/lib/postgresql/data
  ports:
   - 54321:5432
```

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
**Option**

Env | Description
--- | ---
BACKUPHOUR | เวลาที่จะทำการสำรองข้อมูล (0-23) 
BACKUPMINUTE | ระบุนาที
PGHOST | ชื่อ Server เก็บข้อมูล (postgresql)
PGPORT | Port
PGUSER | รหัสผู้ใช้
PGPASS | รหัสผ่าน

## install 

- [SMLAccountPOS v 1.2.22](http://qnapsmldev.myqnapcloud.com:8830/smlinstall/SMLAccountPOSSetup.1.2.22.30866.msi)

## Service

- [SMLJavaWebService](http://qnapsmldev.myqnapcloud.com:8830/service/SMLJavaWebService.war)


