traefik.yml
```
## traefik.yml

# Docker configuration backend
providers:
  docker:
    defaultRule: "Host(`{{ trimPrefix `/` .Name }}.docker.localhost`)"

api:
  dashboard: true
  insecure: true
  
```
