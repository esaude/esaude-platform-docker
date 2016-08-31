<br/><br/><br/>
<img src="https://s3-eu-west-1.amazonaws.com/esaude/images/esaude-site-header.png" alt="OpenMRS"/>
<br/><br/><br/>

# eSaude EMR Platform Docker

[![Build Status](https://travis-ci.org/esaude/esaude-platform-docker.svg?branch=master)](https://travis-ci.org/esaude/esaude-platform-docker)
[![Download](https://api.bintray.com/packages/esaude/platform-docker/tomcat/images/download.svg) ](https://bintray.com/esaude/platform-docker/tomcat/_latestVersion)
[![eSaude Slack](https://slack.esaude.org/badge.svg)](https://slack.esaude.org)

This repository contains the necessary infrastructure code and related resources
required to compose and run Docker containers that start an instance
of the eSaude EMR Platform.

For more information about eSaude EMR visit [esaude.org](http://www.esaude.org/).

## Prerequisites

Make sure you have [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

## Setup

Start by cloning this repository and entering the directory:

````
git clone https://github.com/esaude/esaude-platform-docker.git
cd esaude-platform-docker
````

### Quickstart

Running the following should be enough to pull and run the eSaude EMR Platform:

```
docker-compose -f docker-compose-prebuilt.yml up -d
```

### Details

You have two options. You can either build the Docker images from scratch,
or you can use the [prebuilt images from Bintray](https://bintray.com/esaude/platform-docker).

### Using Prebuilt Images

Run:

```
docker-compose -f docker-compose-prebuilt.yml up -d
```

### Building The Images

Run:

```
docker-compose up -d
```

## Access

To log into eSaude EMR Plaform, use the following details:

* **Host**: [`DOCKER_HOST:8080/openmrs`](http://localhost:8080/openmrs)
* **User**: admin
* **Pass**: eSaude123

## License

[MPL 2.0 w/ HD](http://openmrs.org/license/)
