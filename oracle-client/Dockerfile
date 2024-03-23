FROM oraclelinux:7-slim

# 设置必要的环境变量
ENV ORACLE_BASE=/opt/oracle \
    ORACLE_HOME=/opt/oracle/instantclient_19_9 \
    LD_LIBRARY_PATH=$ORACLE_HOME

# 安装 Oracle Instant Client 和 SQL*Plus
ADD instantclient-basic-linux.x64-19.22.0.0.0dbru.zip $ORACLE_BASE
ADD instantclient-sqlplus-linux.x64-19.22.0.0.0dbru.zip $ORACLE_BASE
RUN yum -y install unzip && \
    unzip $ORACLE_BASE/instantclient-basic-linux.x64-19.22.0.0.0dbru.zip -d $ORACLE_BASE && \
    unzip $ORACLE_BASE/instantclient-sqlplus-linux.x64-19.22.0.0.0dbru.zip -d $ORACLE_BASE && \
    rm -rf $ORACLE_BASE/*.zip && \
    echo $ORACLE_HOME > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig

CMD ["sqlplus"]
