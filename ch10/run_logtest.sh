#/bin/bash
echo "Стопим старые конейнеры"
docker rm -f $(docker ps -aq)

echo "~~~  Запускаем новый конейнер ~~~"
docker run --name logtest  debian sh -c 'echo "stdout"; echo "stderr" >&2'

echo "Проверим логи"
docker logs logtest

echo "Проверим логи с отметками времени"
docker logs  -t logtest
