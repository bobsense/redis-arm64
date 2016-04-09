# Redis Dockerfile

The Dockerfile is used to produce a Docker Redis for [Redis](http://redis.io) on `ARM64`.

# Redis version

Redis 3.0.7

# How to build the Image

You need to git pull redis-arm64.git, then execute the following command under the `redis-arm64` folder to 
create the image `bobsense/redis-arm64`,

```
$ git pull https://github.com/bobsense/redis-arm64.git
$ cd redis-arm64
$ docker build -t bobsense/redis-arm64 .
```

# How to use this Image

## Run the image

The typical way to run the image as follows:

```
$ docker run -d -P --name redis bobsense/redis-arm64
```

You should make sure which port on host is assigned to 6379 exposed on redis container. Type as follows:

```
$ docker port redis 6379
```

Then you will get like `0.0.0.0:32768`, so `32768` is the one assigned to 6379.

You can check the logs of the container by running:

```
$ docker logs redis
```

You can use redis service from the redis container if you see an output like the following:

```
The server is now ready to accept connections on port 6379
```

Then you can log on redis server and run redis as you want. Just type:

```
$ redis-cli -h 127.0.0.1 -p 32768
```

## Persist data

The Redis is configured to store data in the file named `dump.rdb` which is in the same path with redis.conf inside the container. You can map the container's `dump.rdb` volume to a volume on the host so the data becomes independent of the running container. Suppose the dump.rdb on host is under xxxx, and you can do like:

```
$ docker run -d -P -v xxxx/dump.rdb:/root/redis/dump.rdb bobsense/redis-arm64
```

## Use your redis.conf

The redis container starts with the default redis.conf, you can enable your own redis.conf. Suppose the redis.conf on localhost is under xxxx and you can do as follows:

```
$ docker run -d -P -v xxxx/redis.conf:/root/redis/redis.conf bobsense/redis-arm64
```
