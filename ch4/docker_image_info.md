## Информация об образах
Следующие команды представлют собой инструменты для создания и управления образами

#### _docker build_    
Создает образ из Dockerfile

#### _docker commit_    
Создает образ из указанного контейнера
>ID=$(docker run -P -d redis)    
docker commit -a "alex_v" -m "test commit" $ID commit:test              
>>sha256:656fffee79f5c913d2a071d1c39454a8b6441fa067ccab3c313bfc3ed2b7a5b3

>docker images commit
>>REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE      
commit              test                656fffee79f5        55 seconds ago      106MB

#### _docker export_      
Экспортирует содержимое файловой системы на STDOUT. Не экспотируются метаданные контейнера. Выгруженную информацию можно загрузить с помощью docker import
#### _docker history_    
Выводит информацию о кажом уровне в образе
#### _docker images_    
Выводить список образов в системе
> docker images |  head -4

#### _docker import_    
Создает образ из архивного файла , содержащий фаловую систему, созданную с помощью docker export    
Созданный образ является не полным, поскокльку  при экспорте не передаются метаданные (порты и другое)
#### _docker load_   
Загруэает репозиторий tar-архива передаваемый через STDIN.Образы включют метаданные и историю. Tar архивы созадаются с помощью комманды docker save
#### _docker rmi_
Удаляет образы или несколько образов. Если не указан тег, удалет образ с тегом lastest. Если образ существует в нескольких репозиториях,  то необходимо удалять с ключем -f в каждом репозитории.
#### _docker save_
Сохраняет именнованне образы или  репозитории  в tar-архив, передвая их на STDOUT (для записи в файл необходимо использовать опцию -o). Если задано имя репозитория, то в архив будут сохранены все образ даного репозиотрия.       
 > docker save -o /tmp/redis.tar redis:latest     
 docker rmi redis -f      
docker load -i /tmp/redis.tar     
docker images     
>>redis                         latest              d4f259423416        3 weeks ago         106MB


#### _docker tag_    
Связывает имя репозиотрия  и тега с заданным образом
