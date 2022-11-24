#!/bin/bash
# get variables form  locals
source ./automation/docker_getenv.sh


docker run -it -p 3000:4000 --rm $DOCKER_IMAGENAME:$VERSION $1