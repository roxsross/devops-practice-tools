#!/bin/bash
VERSION=`jq -r '.version' ./package.json`
IMAGE=$1
REGISTRY=roxsross12

#ConstruccionImagen
docker build -t $IMAGE:$VERSION .
docker tag $IMAGE:$VERSION $REGISTRY/$IMAGE:$VERSION
docker push $REGISTRY/$IMAGE:$VERSION

###DEPLOY
docker stop $IMAGE:$VERSION
docker run -d -p 4000:4000 $IMAGE:$VERSION

##Verificacion
docker ps