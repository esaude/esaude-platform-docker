FROM tomcat:7

ADD openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD bahmnicore.properties /usr/local/tomcat/.OpenMRS/bahmnicore.properties
ADD wait-for-it.sh /usr/local/wait-for-it.sh
ADD run.sh /run.sh

RUN apt-get update && apt-get install -y curl unzip; \
    curl -k -L https://bintray.com/artifact/download/esaude/platform/1.2.0/openmrs.war \
         -o /usr/local/tomcat/webapps/openmrs.war; \
    mkdir -p /usr/local/tomcat/.OpenMRS/modules; \
    curl -k -L https://bintray.com/artifact/download/esaude/platform/esaude-platform-modules-1.2.4.zip \
         -o /tmp/esaude-emr-modules.zip; \
    unzip /tmp/esaude-emr-modules.zip -d /usr/local/tomcat/.OpenMRS/modules; rm /tmp/esaude-emr-modules.zip;

CMD /run.sh
