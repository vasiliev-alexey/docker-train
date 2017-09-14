#/bin/bash

docker container rm -f -v $(docker container ps -q)

echo "Создаем сеть"
docker network create dude
echo "Пускаем контейнер 1"
docker run -d --net-alias search --net dude elasticsearch:2
echo "Пускаем контейнер 2"
docker run -d --net-alias search --net dude elasticsearch:2


echo "************"
docker  container run --rm --net dude alpine nslookup search

docker container run --rm --net dude centos curl -s search:9200
