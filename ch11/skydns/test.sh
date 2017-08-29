#/bin/bash

HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)

eval $(docker-machine env etcd-1)
#docker run --dns $(docker inspect -f {{.NetworkSettings.IPAddress}} dns) -it redis:3 bash
docker run --dns $(docker inspect -f {{.NetworkSettings.IPAddress}} dns)  \
--dns-search identidock.local -it redis:3 redis-cli -h redis ping

#echo -e "domain identidock.local \nnameserver " $(docker inspect -f {{.NetworkSettings.IPAddress}} dns) > /etc/resolv.conf
