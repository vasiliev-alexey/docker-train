## Команды для работы с реестром
Следующие комманды используются для работы  с реестром, в том числе и на DockerHub

### _docker login_
Выполнет процедуру регистрации или входа на зданный серевер реестра. Если сервер не задан, предполагает вход на DockerHub

### _docker logout_
Выполнет процедуру выхода из зданного серевера реестра. Если сервер не задан, предполагает вход на DockerHub
### _docker pull_
Загружает заданный образ из реестраю Реестр определяется оп имени образа, если он не указан, по умолчанию принимает DockerHub. Если не задано имя тега, будет загружен образ с тегом latest. Для загрузки всех образов - требуется передавть  аргумент -a.

### _docker push_
Выгружает заданный образ или репозитрий в заданный реестр. При отсутсвии тега  выгружаются все образы указаного репозитрия в заданный реестр, а не только образы с тегом latest.
### _docker search_
Выводит список общедоступных репозиотриев из реестра DockerHub, соответсвующи заданому образу. Резыльтат ограничен 25 репозиториев. Можно определять фильтр по количеству звездочек и для автоматизированных сборок.


# Хак чтоб не настраивать  tls для локального Docker registry
Если у нас есть локальный Docker Registry, и мы поленились настраивать на нём HTTPS, нам нужно включить этот Registry в список доверенных.

"insecure-registries": [
 "192.168.2.25:5000"
]
