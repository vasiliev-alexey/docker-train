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
