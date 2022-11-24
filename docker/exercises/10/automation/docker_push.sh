#!/bin/bash
	
##############################
## Get Environment Variables #
##############################
source ./automation/docker_getenv.sh


###############################################
## Pushing the image to repository #
###############################################
docker tag $DOCKER_IMAGENAME:$VERSION $REPOSITORY || exit 1
docker push $DOCKER_IMAGENAME:$VERSION || exit 1