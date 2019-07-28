#!/bin/bash
docker stop zookeeper
docker rm zookeeper
docker run --detach \
    --publish 2181:2181 \
    --name zookeeper \
    zookeeper:latest
