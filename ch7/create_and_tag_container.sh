#/bin/bash
cd identydock/
echo "Создаем образ и сразу присваиваем ему тег и версию"
docker build -t "idenetidoc:0.1" .
echo "присваиваем тег созданному образу с именим на докерхабе avasiliev/idenentidock:0.1"
docker  tag "idenetidoc:0.1" "avasiliev/identydoc:0.1"

#echo "устанавливаем тег latest для созданного образа "
#docker tag  identidoc:latest  avasiliev/identydoc:0.1
echo "Заливаем контейнер на DockerHub"
docker push avasiliev/identydoc:0.1
