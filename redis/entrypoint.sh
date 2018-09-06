#!/usr/bin/env bash

case "$1" in
    redis-server)
        redis-server /etc/redis.conf
        ;;
    redis-client)
        redis-client
        ;;
    *)
        exec "$@"
        ;;
esac
