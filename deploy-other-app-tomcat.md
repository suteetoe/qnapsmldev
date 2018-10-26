
# How To Deploy Other .war in SMLJavawebService Docker

## 1. Create Image File
```
$ cd /data/sml
$ sudo mkdir ./smlwebservice && ./smlwebservice/war
$ cd smlwebservice
```

## 2. Download War ที่จะเพิ่ม มาใส่ ใน /data/sml/smlwebservice/war/


## 3. สร้าง Dockerfile

```
nano Dockerfile
```

ใส่ Code ตามนี้ แล้วทำการ Save โดยกด Ctrl + X

```
FROM smlsoft/smljavawebservice
ADD war/. $CATALINA_HOME/webapps/
```

## 4. Build Docker Image

```
$ sudo docker build -t custom-smljavawebservice .
```

## 5. แก้ไข docker-compose.yml ใน /data/sml/docker-compose.yml

```
$ sudo nano /data/sml/docker-compose.yml
```

ทำการแก้ไขดังนี้

```
image: smlsoft/smljavawebservice
```

แก้ไขเป็น

```
image: custom-smljavawebservice
```

ทำการ Save โดยกด Ctrl + X และสั่ง restart docker-compose 

```
$ cd /data/sml
$ sudo docker-compose up -d
```
