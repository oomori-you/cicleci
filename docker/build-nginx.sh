#!/bin/bash

IMAGE_TAG='latest'
if [ "$1" != '' ]; then
    IMAGE_TAG=$1
fi

pushd $(cd $(dirname $0); pwd) > /dev/null
source ./setenv.sh

# ~/docker/mysql.tarが存在すれば、docker loadでアーカイブをキャッシュとして復元
if [[ -e ~/docker/nginx.tar ]]; then 
  docker load --input ~/docker/nginx.tar
fi

# dockerイメージにビルド
#docker build -f $DOCKERFILE_PATH_NGINX -t $IMAGE_REPO_NGINX:$IMAGE_TAG $IMAGE_BUILD_DIRECTRY_NGINX
docker build -f $DOCKERFILE_PATH_NGINX -t nginx ./nginx/

mkdir -p ~/docker

docker save nginx > ~/docker/nginx.tar
popd > /dev/null
