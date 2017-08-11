#!/bin/bash

#тормозим контенеры
docker stop $(docker ps -aq  -f name=myredis -f  status=running)
docker rm -v $(docker ps -aq -f status=exited -f name=myredis)
docker stop $(docker ps -aq  -f name=mysecondredis -f  status=running)
docker rm -v $(docker ps -aq -f status=exited -f name=mysecondredis)


docker pull redis
#Запускаем первый контейнер
echo "**********  Первый контейнер старт ***************"
docker run --name myredis -d redis
echo "**********  Первый контейнер запущен ***************"
#Запускаем Второй контенер контейнер
echo "**********  Второй контейнер старт ***************"
docker run --rm -it --link myredis:redis --name mysecondredis  redis /bin/bash
echo "**********  Второй контейнер запущен ***************"

