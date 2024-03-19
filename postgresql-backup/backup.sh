#!/bin/sh

#gzip 压缩备份导出，在恢复备份时，需要使用 `gunzip` 或者类似工具解压备份文件
pg_dump -U ${POSTGRES_USER} -d ${POSTGRES_DB} -h ${POSTGRES_HOST} -p ${POSTGRES_PORT} | gzip > /backups/${POSTGRES_DB}-$(date +%Y-%m-%d-%H-%M-%S).sql.gz

#删除最新的20个文件之外的所有文件
ls -1tr /backups | head -n -20 | xargs -d '\n' rm -f --
