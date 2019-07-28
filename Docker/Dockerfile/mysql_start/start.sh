#!/bin/bash
docker stop mysql
docker rm mysql
docker run -p 3306:3306 --name mysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=pcitestdb -e TZ=Asia/Shanghai -d mysql:5.7 
