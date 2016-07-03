#!/bin/bash

IMAGE_TAG='latest'
if [ "$1" != '' ]; then
    IMAGE_TAG=$1
fi

IMAGE_TAG='latest'
if [ "$1" != '' ]; then
    IMAGE_TAG=$1
fi

pushd $(cd $(dirname $0); pwd) > /dev/null
source ./setenv.sh

# ~/docker/mysql.tarが存在すれば、docker loadでアーカイブをキャッシュとして復元
if [[ -e ~/docker/node.tar ]]; then 
  docker load --input ~/docker/node.tar
fi

# dockerイメージにビルド
#docker build -f $DOCKERFILE_PATH_NGINX -t $IMAGE_REPO_NGINX:$IMAGE_TAG $IMAGE_BUILD_DIRECTRY_NGINX
docker build -f $DOCKERFILE_PATH_NODE -t node ./node/

mkdir -p ~/docker

docker save node > ~/docker/node.tar
popd > /dev/null
