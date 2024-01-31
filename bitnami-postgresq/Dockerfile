FROM bitnami/postgresql:16-debian-11
USER root
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
