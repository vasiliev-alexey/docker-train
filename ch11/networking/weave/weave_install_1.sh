#/bin/bash
curl -sL git.io/weave -o /usr/local/bin/weave
chmod a+x /usr/local/bin/weave
weave launch

eval $(weave env)

docker run --name redis -d redis:3

exit
