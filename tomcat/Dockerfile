FROM tomcat:7

ADD openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD bahmnicore.properties /usr/local/tomcat/.OpenMRS/bahmnicore.properties

RUN apt-get update && apt-get install -y curl unzip; \
    curl -L http://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_1.11.5/openmrs.war/download \
         -o /usr/local/tomcat/webapps/openmrs.war; \
    mkdir -p /usr/local/tomcat/.OpenMRS/modules; \
    curl -L http://sourceforge.net/projects/esaude-platform/files/v1.2.0/esaude-platform-modules.zip/download \
         -o /tmp/esaude-emr-modules.zip; \
    unzip /tmp/esaude-emr-modules.zip -d /usr/local/tomcat/.OpenMRS/modules; rm /tmp/esaude-emr-modules.zip;
