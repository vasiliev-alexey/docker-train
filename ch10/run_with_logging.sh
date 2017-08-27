#/bin/bash
cd identidock/
compose_file=prod-with-logging.yml
docker-compose -f $compose_file stop
echo "********** Запуск с логированием  "
docker-compose -f $compose_file up -d



curl -s localhost > /dev/null
docker-compose -f $compose_file  logs logstash
