#!/bin/bash

#variables

VERSION=`jq -r '.version' ./package.json`
IMAGE_NAME=$2
REGISTRY=roxsross12
APP_PORT=4000
TEST_PORT=3000


function help() {
  echo -e "\033[1;36mUsage:
  ./docker.sh [OPTION] [IMAGE_NAME]
  example: ./docker.sh build test-app"
  echo -e "\033[1;36mOptions:
  build : run build only
  push: pushes the images to Docker hub
  run: test images version
  help: prints this menu
  "
}

function build() {
echo -e "\033[1;36mCreate Docker image"
TMP=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -c ${IMAGE_NAME})
[[ ${TMP} -ne 0 ]] \
    && docker rmi -f $IMAGE_NAME:$VERSION > /dev/null
docker build -t $IMAGE_NAME:$VERSION .
echo -e "\033[1;36mDocker images SUCCESSFUL: $IMAGE_NAME:$VERSION"

}

function push() {
echo -e "\033[1;36mPush image to docker hub $IMAGE_NAME:$VERSION"
docker tag $IMAGE_NAME:$VERSION $REGISTRY/$IMAGE_NAME:$VERSION
docker push $REGISTRY/$IMAGE_NAME:$VERSION
echo -e "\033[1;36mDocker push SUCCESSFUL: $REGISTRY/$IMAGE_NAME:$VERSION"
}

function test() {
echo -e "\033[1;36mLaunch and test new image"
TMP=$(date "+%Y%m%d%H%M%S")
docker run --rm -d \
    --name test \
    --publish ${TEST_PORT}:${APP_PORT} \
    $IMAGE_NAME:$VERSION > /dev/null
echo -e "\033[1;36mRun Docker $IMAGE_NAME:$VERSION"
docker ps |grep $IMAGE_NAME:$VERSION
}

function remove() {
echo -e "\033[1;36mRemove Run Images"
docker rm -f test
}

if [ $# -ne 2 ] ;then
    echo -e "\033[0;31mplease specify 2 command line arguments" 
    help
    exit 1
fi

case $1 in
  help)
    help
    ;;
  build)
    build
    ;;
  push)
    push
    ;;
  test)
    test
    ;; 
  remove)
    remove
    ;;     
esac