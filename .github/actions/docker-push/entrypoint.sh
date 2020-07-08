#!/bin/sh
set -e
VERSION=$1
GH_TOKEN=$2

echo $GH_TOKEN | docker login docker.pkg.github.com -u albertnis --password-stdin

docker build -t albertnis/mqcontrol:$VERSION -t albertnis/mqcontrol:latest --push .
