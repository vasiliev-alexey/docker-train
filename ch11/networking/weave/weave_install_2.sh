#/bin/bash
curl -sL git.io/weave -o /usr/local/bin/weave
chmod a+x /usr/local/bin/weave
eval $(weave env)

exit
