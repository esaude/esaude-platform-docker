FROM tomcat:7-jre7-alpine

ENV RELEASE_VERSION __RELEASE_VERSION__
ENV DOCKERIZE_VERSION v0.2.0

ADD openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD bahmnicore.properties /usr/local/tomcat/.OpenMRS/bahmnicore.properties
ADD localtime /etc/localtime
ADD logging.properties /usr/local/tomcat/conf/logging.properties
ADD catalina.properties /usr/local/tomcat/conf/catalina.properties

RUN apk --update add curl unzip fastjar; \
    rm -rf /usr/local/tomcat/webapps/*; \
    curl -k -L https://bintray.com/artifact/download/esaude/platform/1.2.0/openmrs.war \
         -o /usr/local/tomcat/webapps/openmrs.war; \
    mkdir /tmp/war_temp && unzip -q /usr/local/tomcat/webapps/openmrs.war -d /tmp/war_temp; \
    sed -i "s/Powered by/Powered by eSaúde Platform v$RELEASE_VERSION and/g" /tmp/war_temp/WEB-INF/messages.properties; \
    sed -i "s/Desarrollado por/Desarrollado por eSaúde Plataforma v$RELEASE_VERSION y/g" /tmp/war_temp/WEB-INF/messages_es.properties; \
    sed -i "s/Powered by/Powered by eSaúde Platform v$RELEASE_VERSION and/g" /tmp/war_temp/WEB-INF/messages_fa.properties; \
    sed -i "s/poweredBy=OpenMRS/poweredBy=eSaúde Platform v$RELEASE_VERSION and OpenMRS/g" /tmp/war_temp/WEB-INF/messages_hi.properties; \
    sed -i "s/Diberdayakan oleh/Diberdayakan oleh eSaúde Platform v$RELEASE_VERSION dan/g" /tmp/war_temp/WEB-INF/messages_in_ID.properties; \
    sed -i "s/Fornecido Por/Fornecido Por eSaúde Plataforma v$RELEASE_VERSION e/g" /tmp/war_temp/WEB-INF/messages_pt.properties; \
    sed -i "s/Powered by/Powered by eSaúde Platform v$RELEASE_VERSION and/g" /tmp/war_temp/WEB-INF/messages_ru.properties; \
    sed -i "s/poweredBy=OpenMRS/poweredBy=eSaúde Platform v$RELEASE_VERSION සහ/g" /tmp/war_temp/WEB-INF/messages_si.properties; \
    sed -i "s/技术OpenMRS/技术 eSaúde Platform v$RELEASE_VERSION 和 OpenMRS/g" /tmp/war_temp/WEB-INF/messages_zh_CN.properties; \
    cd /tmp/war_temp && fastjar cf /tmp/openmrs-patched.war -M *; \
    mv -f /tmp/openmrs-patched.war /usr/local/tomcat/webapps/openmrs.war; \
    rm -rf /tmp/war_temp;

RUN mkdir -p /usr/local/tomcat/.OpenMRS/modules; \
    curl -k -L https://bintray.com/artifact/download/esaude/platform/esaude-platform-modules-1.6.4.zip \
         -o /tmp/esaude-emr-modules.zip; \
    unzip /tmp/esaude-emr-modules.zip -d /usr/local/tomcat/.OpenMRS/modules; \
    rm /tmp/esaude-emr-modules.zip; \
    curl -k -L https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
         -o /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    rm /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    apk del curl unzip fastjar && rm -f /var/cache/apk/*;

VOLUME /opt/esaude/data

CMD dockerize -wait tcp://esaude-platform-mysql:3306 -timeout 300s /usr/local/tomcat/bin/catalina.sh run
