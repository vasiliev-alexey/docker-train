#/bin/bash
#docker rm $(docker stop $(docker ps -q))

docker-compose stop
docker-compose rm -f -v
docker-compose build
docker-compose up -d
