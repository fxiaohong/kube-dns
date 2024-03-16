# 基础镜像
FROM docker.io/bitnami/postgresql:14.10.0

# 安装依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends alien libaio1 build-essential postgresql-server-dev-14 wget

# 使用 wget 从网络下载 Oracle 19c 客户端 rpm 包并使用 alien 安装
RUN wget -P /opt/oracle/ https://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm && \
    alien -i --scripts /opt/oracle/oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm

# 设置 ORACLE_HOME 环境变量和 LD_LIBRARY_PATH 环境变量
ENV ORACLE_HOME=/usr/lib/oracle/19.3/client64
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib

# 下载并编译安装 oracle_fdw
RUN git clone https://github.com/laurenz/oracle_fdw.git && \
    cd oracle_fdw && \
    make && \
    make install

# 定义 Postgres 配置和启动脚本
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
