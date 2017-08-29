#/bin/bash
echo Рестарт машин - иначе залипают порты докера
docker-machine restart etcd-1
docker-machine restart etcd-2


HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)

#docker-machine scp -r resolv.conf  etcd-1:/etc/resolv.conf

eval "$(docker-machine env etcd-1)"
echo удаляем ранеее запущенные
docker rm -f  -v $(docker ps -aq)

echo "Запускаем etcd на 1 хосте"
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
echo "Запускаем etcd на 2 хосте"
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

echo "Добавляем в днс записи о прослушке порта 53 на всех интерфейсах для домена identidock.local."
curl -XPUT http://${HOSTA}:2379/v2/keys/skydns/config -d value='{"dns_addr":"0.0.0.0:53", "domain":"identidock.local."}' | jq .

eval $(docker-machine env etcd-1)
echo "Устанавливаем образ SkyDns"
docker run -d -e ETCD_MACHINES="http://${HOSTA}:2379,http://${HOSTB}:2379" --name dns skynetservices/skydns:2.5.2a

echo -e "domain identidock.local \nnameserver " $(docker inspect -f {{.NetworkSettings.IPAddress}} dns) > /etc/resolv1.conf


echo "Устанавливаем Redis на  машину 2"
eval $(docker-machine env etcd-2)
docker run -d -p 6379:6379 --name redis redis:3
echo "Регистрируем сервис Redis в etcd"
curl -XPUT http://${HOSTA}:2379/v2/keys/skydns/local/identidock/redis -d value='{"host":"'$HOSTB'", "port":6379}' | jq .
eval $(docker-machine env etcd-1)
echo "Запускаем dnmonster"
docker run -d --name dnmonster amouat/dnmonster:1.0
DNM_IP=$(docker inspect -f {{.NetworkSettings.IPAddress}} dnmonster)
echo "Регистрируем сервис dnmonster"
curl -XPUT http://$HOSTA:2379/v2/keys/skydns/local/identidock/dnmonster -d value='{"host": "'$DNM_IP'", "port":8080}'
echo "Запускаем сервис identidock"
docker run -d  -p 80:9090 amouat/identidock:1.0
