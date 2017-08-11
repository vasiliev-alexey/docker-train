#/bin/bash

dir=cowsay
image_name=test/cowsay-dockerfile
filename=Dockerfile


if  [ -d $dir ]; then
rm -rf $dir
fi

mkdir $dir

cd $dir 
touch $filename

echo "from debian:wheezy" >> $filename
echo "run apt-get update && apt-get install -y cowsay fortune" >> $filename
#echo "ENTRYPOINT [\"/usr/games/cowsay\"]" >> $filename
cp ../cowsay_entrypoint.sh .
echo "COPY cowsay_entrypoint.sh /" >> $filename
echo "ENTRYPOINT [\"/cowsay_entrypoint.sh\"]" >> $filename

docker rm -v $(docker ps -aq -f status=exited)
docker images  |  grep $image_name | awk '{print $1}' | xargs docker rmi


docker build -t $image_name .

if [ $# -eq 0 ]; then
   docker run $image_name
   else
   docker run $image_name $1
fi;

