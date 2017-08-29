#/bin/bash


echo Удаляем машину 1
docker-machine stop consul-1
docker-machine rm  consul-1

echo Удаляем машину 2
docker-machine stop consul-2
docker-machine rm  consul-2
