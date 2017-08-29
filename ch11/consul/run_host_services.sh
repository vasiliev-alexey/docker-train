#/bin/bash
#echo Рестарт машин - иначе залипают порты докера
#docker-machine restart consul-1
#docker-machine restart consul-2


HOSTA=$(docker-machine ip consul-1)
HOSTB=$(docker-machine ip consul-2)
echo  "****  Consul 1  ***"
eval $(docker-machine env consul-1)
echo удаляем ранеее запущенные
docker rm -f  -v $(docker ps -aq)

echo  Запускаем консул 1 и передаем ему адресом свой хост
docker run -d --name consul -h consul-1 \
-p 8300:8300 -p 8301:8301 -p 8301:8301/udp \
-p 8302:8302/udp -p 8400:8400 -p 8500:8500 \
-p 53:8600/udp \
gliderlabs/consul agent -data-dir /data -server \
-client 0.0.0.0 \
-advertise $HOSTA -bootstrap-expect 2

echo  "****  Consul 2 ***"

eval $(docker-machine env consul-2)

echo удаляем ранеее запущенные
docker rm -f  -v $(docker ps -aq)
echo  Запускаем консул 2 и соединяемся с хост А
docker run -d --name consul -h consul-2  \
-p 8300:8300 -p 8301:8301 -p 8301:8301/udp  \
-p 8302:8302/udp -p 8400:8400 -p 8500:8500  \
-p 53:8600/udp  \
gliderlabs/consul agent -data-dir /data -server  \
-client 0.0.0.0  \
-advertise $HOSTB -join $HOSTA



echo "Устанавливаем Redis на  машину 2"
eval $(docker-machine env consul-2)
docker run -d -p 6379:6379 --name redis redis:3
echo "Регистрируем сервис Redis в Consul"
curl -XPUT http://$HOSTA:8500/v1/agent/service/register -d '{"name": "redis", "address": "'$HOSTB'", "port": 6379}'
