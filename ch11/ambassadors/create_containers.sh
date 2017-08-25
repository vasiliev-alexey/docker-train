#/bin/bash

. ./../ch9/token.env
echo "************************** redis-host ******************"
echo Создаем контейнер редиса
eval "$(docker-machine env redis-host)"
echo удаляем ранеее запущенные
docker rm -f  -v $(docker ps -aq)
echo Создаем БД
docker run -d --name real-redis redis:3
echo Создаем прокси
docker run -d --name real-redis-ambassador -p 6379:6379 --link real-redis:real-redis amouat/ambassador

echo "************************** identi-host ******************"
eval "$(docker-machine env identidock-host)"
echo удаляем ранеее запущенные
docker rm -f  -v $(docker ps -aq)

echo Создаем прокси
docker run -d --name redis-ambassador --expose 6379 -e REDIS_PORT_6379_TCP=tcp://$(docker-machine ip redis-host):6379  amouat/ambassador


echo Запускам приложение с генерацикей картинок
docker run -d --name dnmonster amouat/dnmonster:1.0

echo Запускам приложение
docker run -d   --link dnmonster:dnmonster --link  redis-ambassador:redis -p 80:9090  amouat/identidock:1.0
