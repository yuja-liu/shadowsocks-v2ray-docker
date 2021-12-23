FROM shadowsocks/shadowsocks-libev:latest

# get latest v2ray
# only for amd64

COPY get_latest_release.sh /tmp

USER root

RUN apk add --no-cache curl \
    && cd /tmp \
    && source ./get_latest_release.sh \
    && LATEST_VER=$(get_latest_release shadowsocks/v2ray-plugin) \
    && echo The version is $LATEST_VER \
    && wget -q https://github.com/shadowsocks/v2ray-plugin/releases/download/$LATEST_VER/v2ray-plugin-linux-amd64-$LATEST_VER.tar.gz \
    && tar -zxf *.tar.gz \
    && mv v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin \
    && chmod +x /usr/bin/v2ray-plugin \
    && rm get_latest_release.sh \
    && rm *.tar.gz

# override entrypoint.sh to include v2ray

COPY entrypoint.sh /entrypoint.sh

USER nobody

CMD /entrypoint.sh
