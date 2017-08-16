## Управление контейнерами

* _docker attach [OPTIONS] CONTAINER_    
 позволяет пользователь наблюдать  или взаимодейстовать с контейнером
 > ID=$(docker run -d ubuntu sh -c "while true; do echo 'tick'; sleep1; done;")    
 docker attach $ID
* _docker create_    
создает контенер но не запускет его. Чтоб запустить  созданный контенер используется docker start
* _docker cp_ позволяет копировать файлы между файловыми системами контенером и хостом
* _docker exec_    
позволяет  запустить заданную команду внутри контейнера
> ID=$(docker run -d ubuntu sh -c "while true; do echo 'tick'; sleep 1; done;")    
docker exec $ID echo hello    
docker exec -it $ID   /bin/bash
* _docker kill_    
   послылает сигнал контейнеру (PID =1)  SIGKILL. Возвращет  идентификатор контейнера. Можно передать другие коды сигналов через ключ -s
* _docker pause_    
приостанавливате процессы в контейнере, используя механизмы ядрра linux  cgroups freeze. Восстановить  выполнение процессов можно коммандой docker unpause
* _docker restart_
является комбинацией команд docker stop и docker start
* _docker rm_     
удаляет один или несколько контейнеров
  * -v - удаляет ассоциированне тома
  * -f - позволяет удалять запущенные контейнеры
* _docker start_     
запускает оставновленный контейнер
* _docker stop_     
останавливает , но не удаляет контейнер
* _docker unpause_    
возобновляет работу приостановленного контейнера     
