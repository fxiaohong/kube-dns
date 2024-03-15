# 基础镜像
FROM docker.io/bitnami/postgresql:14.10.0 

# 安装必要的依赖
RUN apt-get update \
    && apt-get install -y libaio1 wget unzip \
    && apt-get clean

# 设置环境变量
ENV ORACLE_HOME=/usr/lib/oracle/19.3/client64
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV PATH=$PATH:$ORACLE_HOME/bin

# 下载 Oracle Instant Client
RUN mkdir -p $ORACLE_HOME/network/admin \
    && cd $ORACLE_HOME \
    && wget https://download.oracle.com/otn_software/linux/instantclient/193000/instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip \
    && unzip instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip

# 安装 oracle_fdw 扩展
RUN apt-get update \
    && apt-get install -y postgresql-server-dev-14 build-essential git \
    && git clone https://github.com/laurenz/oracle_fdw.git \
    && cd oracle_fdw \
    && make install \
    && apt-get remove -y postgresql-server-dev-14 build-essential git \
    && apt-get autoremove -y \
    && apt-get clean

# 将 tnsnames.ora 和 sqlnet.ora 文件添加到镜像，这两个文件通常由 DBA 提供
COPY tnsnames.ora $ORACLE_HOME/network/admin/
COPY sqlnet.ora $ORACLE_HOME/network/admin/
