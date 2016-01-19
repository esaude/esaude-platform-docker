<br/><br/><br/>
<img src="https://s3-eu-west-1.amazonaws.com/esaude/images/esaude-site-header.png" alt="OpenMRS"/>
<br/><br/><br/>

# eSaude EMR Platform Docker

This repository contains the necessary infrastructure code and related resources
required to compose and run Docker containers that start an instance
of the eSaude EMR Platform.

For more information about eSaude EMR visit [esaude.org](http://www.esaude.org/).

## Prerequisites

Make sure you have [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

## Setup

Start by cloning this repository:

````
$ git clone https://github.com/esaude/esaude-platform-docker.git
````

Enter the directory and build the images:

````
$ cd esaude-platform-docker
$ docker-compose build
````

Once the build is complete, you'll have to make sure that the mysql container
is initialized due to [this limitation](https://github.com/docker-library/mysql/issues/81).
Do this by running the following:

````
$ docker-compose up esaude-platform-mysql
````

When it's done you can press `ctrl+c` to stop the container. After this you can
run eSaude EMR Platform by executing the following:

````
$ docker-compose up
````

## Access

To log into eSaude EMR Plaform, use the following details:

* **Host**: `DOCKER_HOST:8080/openmrs`
* **User**: admin
* **Pass**: eSaude123

## License

[MPL 2.0 w/ HD](http://openmrs.org/license/) © [OpenMRS Inc.](http://www.openmrs.org/)
