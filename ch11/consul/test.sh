#/bin/bash

HOSTA=$(docker-machine ip consul-1)
HOSTB=$(docker-machine ip consul-2)

eval $(docker-machine env consul-1)
docker exec consul consul members
echo "Добавляем значение"
curl -XPUT http://$HOSTA:8500/v1/kv/foo -d 11111
echo -e "\n"
echo "Считываем значение"
curl -s http://$HOSTA:8500/v1/kv/foo | jq   -r '.[].Value' | base64 -d

echo -e "\n"

echo -e "\n **** Тестим редис  ***"
eval $(docker-machine env consul-2)
docker run amouat/network-utils dig @$HOSTB +short redis.service.consul


# далее делать не стал - так как остальное повтор skydns
