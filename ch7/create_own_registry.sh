#/bin/bash
docker stop $(docker ps -aq)

echo Старт и демонизация реестра
echo ********************************
docker run  -p 5000:5000 -d registry:2
echo ********************************
echo  тегаем созданный контейнер для сохранения в локальном реестре
docker tag avasiliev/identidoc:0.1 localhost:5000/identidoc:0.1
docker push  localhost:5000/identidoc:0.1
