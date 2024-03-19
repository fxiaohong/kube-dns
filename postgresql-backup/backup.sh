#!/bin/sh

echo "开始备份..."
pg_dump -U ${POSTGRES_USER} -d ${POSTGRES_DB} -h ${POSTGRES_HOST} -p ${POSTGRES_PORT} | gzip > /backups/${POSTGRES_DB}-$(date +%Y-%m-%d-%H-%M-%S).sql.gz
echo "备份完成..."

echo "开始清除历史数据..."
ls -1tr /backups | head -n -20 | xargs -d '\n' rm -f --
echo "除历史数据完成..."
