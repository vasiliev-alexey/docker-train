#/bin/bash
docker run -it \
-v ~/.ssh:/root/.ssh:ro \
-v $(pwd)/identidock.yml:/ansible/identidock.yml \
-v $(pwd)/hosts:/etc/ansible/hosts \
--rm=true generik/ansible ansible-playbook identidock.yml
