#!/bin/bash
if [ -z "$1" ]; then
	echo "no install  path param. Usage: ./xwiki_start_docker.sh /home/user/docker/data 8080"
	exit 1
fi
if [ -z "$2" ]; then
	echo "no xwiki port param. Usage ./xwiki_start_docker.sh /home/user/docker/data 8080"
	exit 1
fi	
docker network create -d bridge xwiki-network
docker run -d --name postgres --hostname postgres --net=xwiki-network -ti  -v $1/pgdata:/var/lib/postgresql/data  -e POSTGRES_ROOT_PASSWORD=xwiki -e POSTGRES_USER=xwiki -e POSTGRES_PASSWORD=xwiki -e POSTGRES_DB=xwiki -e POSTGRES_INITDB_ARGS="--encoding=UTF8" -p 5432:5432  postgres:16.3-alpine3.19
docker run -d  --net=xwiki-network    --name xwiki --hostname xwiki -ti -p $2:8080 -v $1/wikidata:/usr/local/xwiki -e DB_USER=xwiki -e DB_PASSWORD=xwiki -e DB_DATABASE=xwiki -e DB_HOST=postgres       xwiki:15.10-postgres-tomcat
