FROM bitnami/postgresql:13.14.0-debian-12-r6
USER root
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
