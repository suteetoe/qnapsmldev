### Clear Container Unuse (stop)
```
$ docker container prune
```

### Run Container 
```
docker run --name <name> -p <external_port>:<container_port> <image_name>
```

Run background
```
docker run --name <name> -p <external_port>:<container_port> -d <image_name>
```
