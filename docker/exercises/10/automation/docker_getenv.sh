#!/bin/bash

DOCKER_IMAGENAME="prueba_node"

if [[ ( ! -z "$VERSION" ) || ( -f "./package.json" ) ]]
      then
      VERSION=`jq -r '.version' ./package.json`
fi

# check registry 
if [ -z "$REGISTRY" ]
then
      REGISTRY="roxsross12"
fi

#get reponame
git_url=$(basename $(git config --get remote.origin.url))
REPONAME=${git_url/\.git/''}
GIT_SHORT=$(git rev-parse --short HEAD) 
GIT_LAST_TAG=$(git tag --sort=committerdate|tail -n 1)  > /dev/null 2>&1
if [ -z $GIT_BRANCH ]; then
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
else 
  BRANCH_NAME=$GIT_BRANCH
fi

# check git user
if [ -z "$GIT_USER_LOGIN" ]
      then
            GIT_USER=$(git log -1 --pretty=format:'%an')
      else
            GIT_USER=$GIT_USER_LOGIN
fi

# echo result
echo -e "\033[1;36m
BRANCH_NAME      is:\t$BRANCH_NAME
GIT_SHORT        is:\t$GIT_SHORT
VERSION          is:\t$VERSION
REGISTRY         is:\t$REGISTRY
DOCKER_IMAGENAME is:\t$DOCKER_IMAGENAME
REPOSITORY       is:\t$REGISTRY/$DOCKER_IMAGENAME:$VERSION 
GIT_USER         is:\t$GIT_USER\n\n\n"

set +x

