# Shadowsocks server docker image with v2ray plugin

Based on [Shadowsocks docker image](https://github.com/shadowsocks/shadowsocks-libev/blob/master/docker/alpine/README.md)
and [v2ray-plugin](https://github.com/shadowsocks/v2ray-plugin).

## Build

Clone the repository and go to the cloned directory, and then

```shell
docker build ./docker -t shadowsocks-v2ray
```

## Run

It is recommended to run a container with [docker-compose](https://docs.docker.com/compose/).

Make change of the configurations in `docker-compose.yml`, e.g.,
password, and then create and run a container in the background by

```shell
docker-compose up -d
```
