#/bin/bash
node_ip_address=$(docker-machine ip node-1)

docker-machine ssh node-1 "docker swarm init --advertise-addr $node_ip_address"

echo 1
eval $(docker-machine env node-1)
