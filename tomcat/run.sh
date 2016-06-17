#!/bin/bash

# wait for mysql to initialise
/usr/local/wait-for-it.sh --timeout=90 esaude-platform-mysql:3306

# start tomcat
/usr/local/tomcat/bin/catalina.sh run
