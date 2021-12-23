#!/bin/sh
# adapted from https://github.com/shadowsocks/shadowsocks-libev/blob/master/docker/alpine/entrypoint.sh

if [[ -f "$PASSWORD_FILE" ]]; then
    PASSWORD=$(cat "$PASSWORD_FILE")
fi

if [[ -f "/var/run/secrets/$PASSWORD_SECRET" ]]; then
    PASSWORD=$(cat "/var/run/secrets/$PASSWORD_SECRET")
fi

# v2ray declaration
PLUGIN=v2ray-plugin
PLUGIN_OPTS=server

exec ss-server \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k ${PASSWORD:-$(hostname)} \
      -m $METHOD \
      --plugin $PLUGIN \
      --plugin-opts $PLUGIN_OPTS \
      -t $TIMEOUT \
      -d $DNS_ADDRS \
      $ARGS
