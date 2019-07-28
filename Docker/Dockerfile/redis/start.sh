#!/bin/bash
REDIS_DIR=/srv/redis
docker stop redis
docker rm redis
docker run --detach \
    --publish 6379:6379 \
    --name redis \
    --volume ${REDIS_DIR}/data:/data \
    redis:latest redis-server --appendonly yes
