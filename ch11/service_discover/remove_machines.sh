#/bin/bash


echo Удаляем машину 1
docker-machine stop etcd-1
docker-machine rm  etcd-1

echo Удаляем машину 2
docker-machine stop etcd-2
docker-machine rm  etcd-2
