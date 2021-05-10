#!/bin/bash

VERSION=6.2
PLATFORM=braswell
OUTPUT_DIR=./output/$VERSION/$PLATFORM

docker build \
  --build-arg VERSION=$VERSION \
  --build-arg PLATFORM=$PLATFORM \
  --tag synobuild .

mkdir -p $OUTPUT_DIR
container_id=$(docker create synobuild)
docker cp $container_id:/tmp/synouidmod $OUTPUT_DIR
docker rm $container_id
