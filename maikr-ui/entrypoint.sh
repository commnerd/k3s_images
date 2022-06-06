#!/bin/bash

API_PATH=$(echo ${API_PATH} | sed -E 's/([\/\.])/\\\1/g')

for f in $(ls /usr/share/nginx/html)
do
	sed -Ei "s/path-to-api/${API_PATH}/g" /usr/share/nginx/html/${f};
done

exec "/docker-entrypoint.sh $@" #Original nginx image entrypoint
