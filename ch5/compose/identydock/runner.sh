#/bin/bash
docker-compose stop
docker-compose rm -f -v
docker-compose build
docker-compose up -d
