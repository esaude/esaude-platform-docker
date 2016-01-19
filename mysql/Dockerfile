FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=openmrs
ENV MYSQL_USER=esaude
ENV MYSQL_PASSWORD=esaude

RUN apt-get update && apt-get install -y curl unzip; \
    curl -L http://sourceforge.net/projects/esaude-platform/files/v1.2.0/esaude-platform-database.sql.zip/download \
             -o /tmp/esaude-platform-database.sql.zip; \
    unzip /tmp/esaude-platform-database.sql.zip -d /docker-entrypoint-initdb.d; \
    rm /tmp/esaude-platform-database.sql.zip
