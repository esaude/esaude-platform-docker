FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD=eSaudeRootMySQLPassword
ENV MYSQL_DATABASE=openmrs
ENV MYSQL_USER=esaude
ENV MYSQL_PASSWORD=eSaudeUserMySQLPassword
ENV MYSQL_DATA_DIRECTORY=/opt/esaude/data/system/mysql

ADD esaude-mysql.cnf /root/.my.cnf
ADD backup /usr/bin/backup
ADD localtime /etc/localtime

RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
&& curl -L https://bintray.com/artifact/download/esaude/platform/esaude-platform-database-2.0.5.sql.zip \
    -o /tmp/esaude-platform-database.sql.zip \
&& apt-get remove -y \
   curl \
   zip  

COPY run.sh /run.sh

VOLUME /opt/esaude/data

EXPOSE 3306

CMD ["/run.sh"]
