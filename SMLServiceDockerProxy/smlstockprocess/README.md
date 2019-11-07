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
server = cloud.smldatacenter.com
port = 5672
user = admin
password = sml
channel = smlstockprocess-queue

```

