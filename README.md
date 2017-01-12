## HOW TO BUILD A DOCKER IMAGE

+ To build the PHP7 image running on Apache2.4 webserver execute the following steps:

```sh
#! /bin/bash

#
# build the docker image
#
docker build -t gluzangi/rocks:httpd-php7 -f Dockerfile .

#
# tag the image and prepare it to be pushed to a docker registry
#
docker tag [container_id] httpd-php7 gluzangi/rocks:httpd-php7

#
# push the image to a remote registry
#
docker push gluzangi/rocks:httpd-php7
```
## HOW TO CONTAINERIZE THE IMAGE

+ To instantiate the built docker container execute the following steps:

```sh
#! /bin/bash

#
# start php7 with apache as a web server 
#
docker run -d --name php-www-01 -p 8082:80 -v $PWD/php.www:/var/www/html gluzangi/rocks:httpd-php7

#
# start php7 with apache in an interactive mode 
#
docker run -it --name php-www-01 -p 8082:80 -v $PWD/php.www:/var/www/html gluzangi/rocks:httpd-php7 /bin/bash
```
