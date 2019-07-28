#!/bin/bash
docker stop eureka
docker rm eureka
docker run -p 8761:8761 -d --name eureka  pcidata/eureka
