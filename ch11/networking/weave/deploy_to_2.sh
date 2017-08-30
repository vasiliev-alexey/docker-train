#/bin/bash
docker-machine scp weave_install_2.sh weave-identidock:~/weave-install.sh

docker-machine ssh  weave-identidock "docker rm -f -v $(docker ps -aq)"
docker-machine ssh  weave-identidock "./weave-install.sh"
docker-machine ssh  weave-identidock "weave launch $(docker-machine ip weave-redis)"
docker-machine ssh  weave-identidock "eval(weave env)"
docker-machine ssh  weave-identidock "docker run -d  --name dnmonster   amouat/dnmonster:1.0"
docker-machine ssh  weave-identidock "docker run -d  --name identidoc  -p 80:9090 amouat/identidock:1.0"
