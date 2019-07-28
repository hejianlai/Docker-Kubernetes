#!/bin/bash
docker stop kafka
docker rm kafka
docker run -d --name kafka --publish 9092:9092\
              --link zookeeper --env KAFKA_ZOOKEEPER_CONNECT=47.244.188.35:2181 \
              --env KAFKA_ADVERTISED_HOST_NAME=47.244.188.35 --env KAFKA_ADVERTISED_PORT=9092 \
              --volume /etc/localtime:/etc/localtime \
              wurstmeister/kafka:latest

