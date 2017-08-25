#/bin/bash

. ./../ch9/token.env
echo Создаем машину 1
docker-machine create --driver digitalocean --digitalocean-access-token $DITOCKEN identidock-host
echo Создаем машину 2
docker-machine create --driver digitalocean --digitalocean-access-token $DITOCKEN redis-host
