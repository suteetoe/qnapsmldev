# SML Service Proxy

## Traefik Compose

Download Configfile
```
$ sudo wget https://raw.githubusercontent.com/containous/traefik/master/traefik.sample.toml  
$ sudo mv traefik.sample.toml  traefik.toml 
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

## SMLJavaWebService Config


Append in Docker
```
labels:
   - "traefik.enable=true"
   - "traefik.docker.network=sml_service_network"
   - "traefik.frontend.rule=PathPrefixStrip:/SMLJavaWebService/"
   - "traefik.frontend.redirect.regex=^(.*)/SMLJavaWebService$$"
   - "traefik.frontend.redirect.replacement=$$1/SMLJavaWebService/"
   - "traefik.frontend.rule=PathPrefix:/SMLJavaWebService"

   - "traefik.backend=smlclouddcweb"
   - "traefik.docker.network=frontend_networks"
   # filter With Hostname
   - "traefik.frontend.rule=Host:smlsupport.smldatacenter.com"
   
   # remove /api/ in backend 
   - "traefik.frontend.rule=Host:crm.coconutpos.com;PathPrefix:/api/;PathPrefixStrip:/api/"

```

More Config 
```
https://github.com/containous/traefik/issues/2806
```
