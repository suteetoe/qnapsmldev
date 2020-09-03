```
version: '3'

services:
  registry:
   image: registry:2
   environment:
    REGISTRY_AUTH: htpasswd
    REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
    REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
    REGISTRY_STORAGE_DELETE_ENABLED: "true"
   volumes:
    - ./data:/var/lib/registry
    - ./auth:/auth
    - ./cert:/certs
   labels:
    - "traefik.port=5000"
    # - "traefik.docker.network=traefik_traefik-net"
    - "traefik.frontend.entryPoints=https,http"
    - "traefik.frontend.rule=Host:docker.smldatacenter.com"
   networks:
    - backend

  registry_web_ui:
   image: joxit/docker-registry-ui
   environment:
    - REGISTRY_URL=http://docker.smldatacenter.com
    - REGISTRY_TITLE="SMLSoft registry"
   networks:
     - backend
   labels:
    - "traefik.port=80"
    # - "traefik.docker.network=traefik_traefik-net"
    - "traefik.frontend.entryPoints=https"
    - "traefik.frontend.rule=Host:docker.smldatacenter.com;PathPrefix:/ui;PathPrefixStrip:/ui"

networks:
  backend:
    external:
      name: service_networks
```
