# В данном репозитории решения заданий по курсу docker на 3.
Скрипт без использования docker-compose запускает xwiki(15.10-postgres-tomcat) с БД postgresql (postgres:16.3) с образом скачанным из docker hub.
Использование скрипта:

```
./xwiki_start_docker.sh /path/to/file 8081 
```
/path/to/file - Путь по которому будут созданы папки с данными (pgdata и wikidata), которые необходимы для работы БД и приложения
8081 - Порт на котором будет запущен xwiki

Скрипт создаст отельную docker сеть (xwiki-network) для контейнеров. Приложение будет доступно на IP хостовой машины на указанном порту. 
 
