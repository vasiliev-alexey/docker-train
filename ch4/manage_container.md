## Управление контейнерами

* docker attach [OPTIONS] CONTAINER    
 позволяет пользователь наблюдать  или взаимодейстовать с контейнером
 > ID=$(docker run -d ubuntu sh -c "while true; do echo 'tick'; sleep1; done;")    
 docker attach $ID
* docker create    
создает контенер но не запускет его. Чтоб запустить  созданный контенер используется docker start
* docker cp    
позваоляет копировать файлы между файловыми системами контенером и хостом
* docker exec    
позволяет  запустить заданную команду внутри контейнера
> ID=$(docker run -d ubuntu sh -c "while true; do echo 'tick'; sleep 1; done;")    
docker exec $ID echo hello    
docker exec -it $ID   /bin/bash
