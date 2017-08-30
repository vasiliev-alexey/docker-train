#/bin/bash
eval $(docker-machine env weave-redis )
docker-machine scp weave_install_1.sh weave-redis:~/weave-install.sh

docker-machine ssh weave-redis "./weave-install.sh"
