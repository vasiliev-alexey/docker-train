#/bin/bash

HOSTA=$(docker-machine ip etcd-1)
HOSTB=$(docker-machine ip etcd-2)

curl -s http://$HOSTA:2379/v2/members | jq '.'

echo "***** PUT VALUE to A"

curl -s http://$HOSTA:2379/v2/keys/service_name -XPUT -d value="service_address" | jq '.'

echo "***** GEt VALUE from B"
curl -s http://$HOSTB:2379/v2/keys/service_name  | jq '.'
