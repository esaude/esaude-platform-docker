FROM alpine:3.4

ENV MYSQL_ROOT_PASSWORD=eSaudeRootMySQLPassword
ENV MYSQL_DATABASE=openmrs
ENV MYSQL_USER=esaude
ENV MYSQL_PASSWORD=eSaudeUserMySQLPassword
ENV MYSQL_DATA_DIRECTORY=/opt/esaude/data/system/mysql

ADD esaude-mysql.cnf /root/.my.cnf
ADD backup /usr/bin/backup

RUN apk add --update mariadb curl unzip; \
    curl -L https://bintray.com/artifact/download/esaude/platform/1.2.0/esaude-platform-database.sql.zip \
         -o /tmp/esaude-platform-database.sql.zip; \
    apk del curl && rm -f /var/cache/apk/*

COPY run.sh /run.sh

VOLUME /opt/esaude/data

EXPOSE 3306

CMD ["/run.sh"]
