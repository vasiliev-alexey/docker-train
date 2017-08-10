## Установка и первичная настройка

1. Для устновки докера на Linux используем получение инсталяционного скрипта через
curl https://get.docker.com > linux_install.sh

2. При наличии SELinux переводим его в режим обучения

3. Для того чтобы пользователь мог пользоваться Docker без повышения прав , включаем его в группу docker
> sudo groupadd docker  
sudo gpasswd -a $USER docker  
sudo service docker restart
docker version
