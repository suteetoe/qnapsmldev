# SMLStockProcess

## Config SMLJavaWebService (RabbimtMQ)

```
$ cd <tomcat_temp>
$ nano smlstockprocess.cfg

```

in smlstockprocess.cfg 
```

# rabbitmq config
type = rabbitmq
server = rabbitmq_smlprocess
port = 5672
user = admin
password = adminsml
channel = smlstockprocess-queue

```

