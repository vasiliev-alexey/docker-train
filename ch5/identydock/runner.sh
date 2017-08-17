#/bin/bash
docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker build -t identydock .
docker run -d -p 9090:9090  -p 9091:9091 identydock
