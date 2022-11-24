#!/bin/bash
# get variables locals
source ./automation/docker_getenv.sh

docker build -t $DOCKER_IMAGENAME:$VERSION . || exit 1