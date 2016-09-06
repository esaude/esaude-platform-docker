#!/bin/bash

# Log in to the Bintray Docker registry
docker login -u $BINTRAY_USER -p $BINTRAY_API_KEY esaude-docker-platform-docker.bintray.io

set -o xtrace

# Tag the tomcat image
docker tag `docker images -q esaude_esaude-platform-tomcat` esaude-docker-platform-docker.bintray.io/tomcat:$TRAVIS_TAG

# Push the tomcat image
docker push esaude-docker-platform-docker.bintray.io/tomcat:$TRAVIS_TAG

# Tag the mysql image
docker tag `docker images -q esaude_esaude-platform-mysql` esaude-docker-platform-docker.bintray.io/mysql:$TRAVIS_TAG

# Push the mysql image
docker push esaude-docker-platform-docker.bintray.io/mysql:$TRAVIS_TAG

# Bundle app for offline install
docker save -o esaude-app-platform.tar esaude-docker-platform-docker.bintray.io/tomcat esaude-docker-platform-docker.bintray.io/mysql
gzip esaude-app-platform.tar

# Notify to slack
SLACK_MESSAGE="New eSaude Platform <https://bintray.com/esaude/poc-docker/poc|Docker images> and <https://bintray.com/esaude/apps/esaude-app-platform|offline installer> published ($TRAVIS_TAG)"
curl -X POST --data-urlencode 'payload={"username": "eSaude Bintray", "text": "'"$SLACK_MESSAGE"'", "icon_url": "https://bintray.com/assets/favicon.png"}' $SLACK_WEBHOOK_URL
