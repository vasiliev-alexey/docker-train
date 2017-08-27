#/bin/bash
echo "Стопим старые конейнеры"
docker rm -f $(docker ps -aq)
echo "Запускаем тестовый контейнер со стримом данных"
docker run -d --name streamtest debian \
  sh -c 'while true; do date; sleep 1; done'

sleep 10;
echo "************ ЛОГИ *********************"
docker logs -f     streamtest
