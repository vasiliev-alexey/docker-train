#/bin/bash
. ./token.env
docker-machine create --driver digitalocean --digitalocean-access-token $DITOCKEN identihost-do

eval "$(docker-machine env identihost-do)"
