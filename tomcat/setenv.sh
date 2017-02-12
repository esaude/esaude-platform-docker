export JAVA_OPTS="-Dfile.encoding=UTF-8 -server -Xms512m -Xmx1536m -XX:PermSize=256m -XX:MaxPermSize=768m -Duser.timezone=Africa/Maputo"

#Allow debug
export CATALINA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"