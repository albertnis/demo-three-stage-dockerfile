#!/bin/sh
set -e

BUILD_DIR=dist
ARTIFACT_PATH=$BUILD_DIR/$1

docker build --target export -o $BUILD_DIR .

chmod -R 755 $BUILD_DIR
echo "::set-output name=artifact_path::./$BUILD_DIR/helloworld.js"