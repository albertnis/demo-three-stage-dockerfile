#!/bin/sh
set -e
VERSION=$1
GH_TOKEN=$2
IMAGE_NAME=docker.pkg.github.com/albertnis/demo-three-stage-dockerfile/helloworld

docker login docker.pkg.github.com -u albertnis -p $GH_TOKEN

docker build -t img .

docker tag img $IMAGE_NAME:$VERSION
docker push $IMAGE_NAME:$VERSION

docker tag img $IMAGE_NAME:latest
docker push $IMAGE_NAME:latest
