from debian:wheezy
run apt-get update && apt-get install -y cowsay fortune
COPY cowsay_entrypoint.sh /
ENTRYPOINT ["/cowsay_entrypoint.sh"]
