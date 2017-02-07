FROM alpine:3.4

ENV MYSQL_ROOT_PASSWORD=eSaudeRootMySQLPassword
ENV MYSQL_DATABASE=openmrs
ENV MYSQL_USER=esaude
ENV MYSQL_PASSWORD=eSaudeUserMySQLPassword
ENV MYSQL_DATA_DIRECTORY=/opt/esaude/data/system/mysql

ADD esaude-mysql.cnf /root/.my.cnf
ADD backup /usr/bin/backup
ADD localtime /etc/localtime

RUN apk add --update mariadb mariadb-client curl zip unzip; \
    curl -L https://bintray.com/artifact/download/esaude/platform/esaude-platform-database-1.2.1.sql.zip \
         -o /tmp/esaude-platform-database.sql.zip; \
    apk del curl unzip && rm -f /var/cache/apk/*; \
    rm /usr/bin/mysql_client_test_embedded; \
    rm /usr/bin/mysqltest; \
    rm /usr/bin/mysqltest_embedded;

COPY run.sh /run.sh

VOLUME /opt/esaude/data

EXPOSE 3306

CMD ["/run.sh"]
