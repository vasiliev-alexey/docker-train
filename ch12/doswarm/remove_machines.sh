#/bin/bash


echo Удаляем машины
docker-machine stop $(docker-machine ls -q)
docker-machine rm   $(docker-machine ls -q)
