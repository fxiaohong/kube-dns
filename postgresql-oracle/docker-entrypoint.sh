#!/bin/sh
set -e

# 启动 postgres 并启动 oracle_fdw
pg_ctl start
psql -c "CREATE EXTENSION oracle_fdw;"

# 其他你需要执行的操作
# ...

# 代理其他命令
exec "$@"
