
# Traefik Config

```
[respondingTimeouts]
  readTimeout = "20s"
  writeTimeout = "20s"

################################################################
# API and dashboard configuration
################################################################
[entryPoints]
  [entryPoints.http]
  address = ":80"
    [entryPoints.http.redirect]
    entryPoint = "https"
  [entryPoints.https]
  address = ":443"
    [entryPoints.https.tls]
    minVersion = "VersionTLS12"

[api]
################################################################
# Docker configuration backend
################################################################
[docker]
domain = "docker.local"
watch = true


[acme]
email = "xx@mail.com"
entryPoint = "https"
storage = "/acme.json"
caServer = "https://acme-v02.api.letsencrypt.org/directory"
onHostRule = true
  [acme.httpChallenge]
    entryPoint = "http"
  [[acme.domains]]
   main = "yourdomain.com"

```

## Docker compose file

```
services:
  loadbalance:
    image: traefik:1.7
    ports:
      - 80:80
      - 8080:8080
      - 443:443
    volumes:
      - ./traefik.toml:/etc/traefik/traefik.toml
      - /var/run/docker.sock:/var/run/docker.sock
      - ./acme.json:/acme.json


```