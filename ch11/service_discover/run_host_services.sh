#/bin/bash

HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)

eval "$(docker-machine env etcd-1)"
echo удаляем ранеее запущенные
docker rm -f  -v $(docker ps -aq)
docker run -d -p 2379:2379 -p 2380:2380 -p 4001:4001 \
 --name etcd quay.io/coreos/etcd /usr/local/bin/etcd \
 -name etcd-1 -initial-advertise-peer-urls http://${HOSTA}:2380 \
 -listen-peer-urls http://0.0.0.0:2380 \
 -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
 -advertise-client-urls http://${HOSTA}:2379 \
 -initial-cluster-token etcd-cluster-1 \
 -initial-cluster \
    etcd-1=http://${HOSTA}:2380,etcd-2=http://${HOSTB}:2380 \
 -initial-cluster-state new


eval $(docker-machine env etcd-2)
echo удаляем ранеее запущенные
docker rm -f  -v $(docker ps -aq)
docker run -d -p 2379:2379 -p 2380:2380 -p 4001:4001 \
  --name etcd quay.io/coreos/etcd /usr/local/bin/etcd \
  -name etcd-2 -initial-advertise-peer-urls http://${HOSTB}:2380 \
  -listen-peer-urls http://0.0.0.0:2380 \
  -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
  -advertise-client-urls http://${HOSTB}:2379 \
  -initial-cluster-token etcd-cluster-1 \
  -initial-cluster \
     etcd-1=http://${HOSTA}:2380,etcd-2=http://${HOSTB}:2380 \
  -initial-cluster-state new
