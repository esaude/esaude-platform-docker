FROM tomcat:7-jre7-alpine

ENV DOCKERIZE_VERSION v0.2.0

ADD openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD bahmnicore.properties /usr/local/tomcat/.OpenMRS/bahmnicore.properties
ADD localtime /etc/localtime
ADD logging.properties /usr/local/tomcat/conf/logging.properties
ADD catalina.properties /usr/local/tomcat/conf/catalina.properties

RUN apk --update add curl unzip; \
    rm -rf /usr/local/tomcat/webapps/*; \
    curl -k -L https://bintray.com/artifact/download/esaude/platform/1.2.0/openmrs.war \
         -o /usr/local/tomcat/webapps/openmrs.war;

RUN mkdir -p /usr/local/tomcat/.OpenMRS/modules; \
    curl -k -L https://bintray.com/artifact/download/esaude/platform/esaude-platform-modules-1.6.6.zip \
         -o /tmp/esaude-emr-modules.zip; \
    unzip /tmp/esaude-emr-modules.zip -d /usr/local/tomcat/.OpenMRS/modules; \
    rm /tmp/esaude-emr-modules.zip; \
    curl -k -L https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
         -o /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    rm /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    apk del curl unzip && rm -f /var/cache/apk/*;

VOLUME /opt/esaude/data

CMD dockerize -wait tcp://esaude-platform-mysql:3306 -timeout 300s /usr/local/tomcat/bin/catalina.sh run
