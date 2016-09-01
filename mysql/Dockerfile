FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD=eSaudeRootMySQLPassword
ENV MYSQL_DATABASE=openmrs
ENV MYSQL_USER=esaude
ENV MYSQL_PASSWORD=eSaudeUserMySQLPassword

ADD esaude-mysql.cnf /etc/mysql/conf.d/esaude-mysql.cnf
ADD backup /usr/bin/backup

RUN apt-get update && apt-get install -y curl zip unzip; \
    curl -k -L https://bintray.com/artifact/download/esaude/platform/1.2.0/esaude-platform-database.sql.zip \
         -o /tmp/esaude-platform-database.sql.zip; \
    unzip /tmp/esaude-platform-database.sql.zip -d /docker-entrypoint-initdb.d; \
    rm /tmp/esaude-platform-database.sql.zip
