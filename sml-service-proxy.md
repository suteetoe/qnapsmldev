# SML Service Proxy

## Traefik Compose

Download Configfile
```
$ wget  
$ mv 
```

Install Traefik With Docker-compose

```
version: '3'

services:
  traefik_proxy:
    image: traefik
    container_name: traefik_proxy
    restart: always
    ports:
     - 8080:8080 ## monitor
     - 8081:80 ## http
    volumes:
     - ./traefik.toml:/etc/traefik/traefik.toml
     - /var/run/docker.sock:/var/run/docker.sock
    networks:
     - backend
networks:
  backend:
   external:
     name: sml_service_network
     
```
