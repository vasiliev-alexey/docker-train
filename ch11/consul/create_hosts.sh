#/bin/bash

. ./../../ch9/token.env
echo Создаем машину 1
docker-machine create --driver digitalocean --digitalocean-access-token $DITOCKEN consul-1
echo Создаем машину 2
docker-machine create --driver digitalocean --digitalocean-access-token $DITOCKEN consul-2
