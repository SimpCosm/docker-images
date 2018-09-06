FROM registry.cn-beijing.aliyuncs.com/unicosmos/debian
LABEL maintainer="houmin_wei@outlook.com"

ENV REDIS_VERSION 4.0.11

RUN set -ex \
    && build_deps='\
        gcc \
        libc6-dev \
        make \
        wget \
    ' \
    && apt-get update && apt-get install -yqq $build_deps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && wget -q -O redis.tar.gz "http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz" \
    && mkdir -p /usr/src/redis \
    && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
    && rm redis.tar.gz \
    && cd /usr/src/redis \
    && make -j "$(nproc)" \
    && make install \
    && rm -rf /usr/src/redis \
    && apt-get purge -y --auto-remove $build_deps

WORKDIR /home/work

COPY entrypoint.sh entrypoint.sh
COPY redis.conf /etc/redis.conf
EXPOSE 6379

USER work
ENTRYPOINT ["./entrypoint.sh"]
CMD ['redis-server', '/etc/redis.conf']
