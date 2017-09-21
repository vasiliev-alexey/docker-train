#/bin/bash

. ./../../ch9/token.env
echo Создаем машину 1 2 3

for i in 1 2 ; do
echo create machine node-$i ...

docker-machine create --driver digitalocean \
--digitalocean-image  ubuntu-16-04-x64 \
--digitalocean-access-token $DITOCKEN node-$i; done


#curl https://get.docker.com | sh
