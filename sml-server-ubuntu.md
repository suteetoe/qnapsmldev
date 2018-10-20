# Step
1. Install Docker
2. Install Docker-compose
3. Create SML Compose File

### Step 1 Install Docker

- Install Package 

```
$ sudo apt-get update
$ sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt-key fingerprint 0EBFCD88
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
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

### Step 2. Docker compose

1.Docker Compose Install

```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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

### 3.  ลงแบบ docker compose

- รันคำสั่งเพื่อสร้าง Folders

```
$ sudo mkdir /data && sudo mkdir /data/sml
$ cd /data/sml
$ sudo mkdir ./tomcat && sudo mkdir ./tomcat/temp && sudo mkdir ./postgresql && sudo mkdir ./postgresql/data && sudo mkdir ./backups

$ sudo docker network create sml_service_network

$ sudo nano docker-compose.yml

```
- คัดลอก ลงไป

```
version: '3'

services:
  smljavawebservice:
    image: smlsoft/smljavawebservice
    container_name: sml_webservice
    restart: always
    ports:
      - 8080:8080
    volumes:
      - ./tomcat/temp:/usr/local/tomcat/temp
    networks:
      - backend
  postgresql:
    image: smlsoft/smlpostgres:10.4-thai
    container_name: sml_postgresql
    restart: always
    environment:
      POSTGRES_PASSWORD: sml
    ports:
      - 5432:5432
    volumes:
      - ./postgresql/data:/var/lib/postgresql/data
    networks:
      - backend
  postgrsql_backup:
    image: smlsoft/smlpgbackup:10.4
    container_name: sml_postgresql_autobackup
    restart: always
    volumes:
      - ./backups:/var/lib/postgresql/backups
    environment:
      - BACKUPHOUR=23
      - BACKUPMINUTE=0
      - PGHOST=sml_postgresql
    networks:
      - backend
      
networks:
  backend:
    external:
      name: sml_service_network

```

- รันคำสั่ง

```
$ sudo docker-compose up -d
```


### Tuneing
`Postgrseql Path : /data/sml/postgresql/data/postgresql.conf`
