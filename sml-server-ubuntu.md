# Project For save git compose, command, images

## - Install Docker For Windows

## - Install Docker For Linux

### CentOS 7

- ติดตั้ง packages 
```
$ sudo yum install -y yum-utils device-mapper-persistent-data  lvm2
```

- ตั้งค่า repo
```
$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

- ติดตั้ง docker
```
$ sudo yum install -y docker-ce
```

- เปิด service
```
$ systemctl enable docker
```

- run service docker
```
sudo systemctl start docker
```

- Check version installation successful
```
$ docker -v
```

### Ubuntu (from the Official Docker Repository)

- Install Package 

```
$ sudo apt-get update
$ sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt-key fingerprint 0EBFCD88
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

for ubuntu 17

```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty stable"
```

- Update ส่วนเสริมสำหรับติดตั้ง

```
$ sudo apt-get update
```

- สั่งติดตั้ง Docker CE

```
$ sudo apt-get install docker-ce
```

- ตรวจสอบการติดตั้ง

```
$ sudo docker -v
```

### Ubuntu ( Docker from ubuntu repository)

```
$ sudo apt-get update
$ sudo apt-get install curl
$ sudo apt install docker.io
$ sudo systemctl start docker
$ sudo systemctl enable docker
$ docker --version
```

### Docker compose

1.Docker Compose Install

```
$ sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

2.Change permission

```
$ sudo chmod +x /usr/local/bin/docker-compose
```

3.Check version installation successful

```
$ docker-compose --version
```

4.ถ้าติดตั้งสมบูรณ์ ระบบจะแสดงข้อความ
```
docker-compose version 1.17.0, build 1719ceb
```

# ลงแบบ docker compose

- รันคำสั่งเพื่อสร้าง Folders

```
$ sudo mkdir /data && sudo mkdir /data/sml
$ cd /data/sml
$ sudo mkdir ./tomcat && sudo mkdir ./tomcat/temp && sudo mkdir ./postgresql && sudo mkdir ./postgresql/data && sudo mkdir ./backups

$ sudo docker network create sml_service_network

$ sudo nano docker-compose.yml

```

- copy ไฟล์ docker-compose.yml ไปไว้ที /data/sml
- รันคำสั่ง

```
$ sudo docker-compose up -d
```


# ลงแบบที่ละ cotainer

## - Install SMLJavaWebService
```
$ sudo docker pull smlsoft/smljavawebservice
$ sudo docker run --name smlwebservice -p 8080:8080 --restart=always -d smlsoft/smljavawebservice
```

## - Install PostgreSQL
```
$ sudo docker pull postgres:10.1-alpine
$ sudo docker run --name postgresql-10 -e POSTGRES_PASSWORD=sml -v /home/pgsql/data:/var/lib/postgresql/data --restart=always -p 5432:5432 -d postgres
```
