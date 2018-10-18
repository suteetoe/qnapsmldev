# Install SMLMobileStock

** Prerequest Docker, Docker Compose


```
sudo cd /data/sml/
sudo mkdir mobilestock
sudo cd mobilestock

sudo nano docker-compose.yml

```

```
version: '3'

services:
  smlmobile:
  #image: smlsoft/mobilestock
  build: ./mobilestock-2.3
  container_name: sml_mobilestock
  expose:
   - 80
  ports:
   - 80:80
  networks:
   - backend
  environment:
   - DB_HOST=sml_postgresql
   - DB_PORT=5432
   - DB_USER=postgres
   - DB_PASSWORD=sml
   - DB_NAME=data1
networks:
 backend:
  external:
   name: sml_service_network

```

สั่ง Run 
```
sudo docker-compose up -d
```
