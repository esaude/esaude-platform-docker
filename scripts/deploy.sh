#!/bin/bash

# Log in to the Bintray Docker registry
docker login -u $BINTRAY_USER -p $BINTRAY_API_KEY -e $BINTRAY_EMAIL esaude-docker-platform-docker.bintray.io

# Tag the tomcat image
docker tag `docker images -q esaudeplatformdocker_esaude-platform-tomcat` esaude-docker-platform-docker.bintray.io/tomcat:$TRAVIS_TAG

# Push the tomcat image
docker push esaude-docker-platform-docker.bintray.io/tomcat:$TRAVIS_TAG

# Tag the mysql image
docker tag `docker images -q esaudeplatformdocker_esaude-platform-mysql` esaude-docker-platform-docker.bintray.io/mysql:$TRAVIS_TAG

# Push the mysql image
docker push esaude-docker-platform-docker.bintray.io/mysql:$TRAVIS_TAG
