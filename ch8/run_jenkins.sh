#/bin/bash
echo Стопим все
docker stop $(docker ps -aq)

cd identijenk
echo Строим образ с дженкинс
docker build -t identijenk .
#echo Запускаем докуер в докер и маппим сокет
#docker run -v /var/run/docker.sock:/var/run/docker.sock  identijenk sudo docker ps
docker run  --name jenkins-data identijenk  echo "jenkins  data container"

echo Запускаем докуер в докер и маппим сокет  и импортируем тома из контейнера с данными
docker run -d --name jenkins -p 8080:8080  --volumes-from jenkins-data -v /var/run/docker.sock:/var/run/docker.sock  identijenk
