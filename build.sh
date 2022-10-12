#!/bin/bash

COMMIT=$(git rev-parse --short HEAD)
BRANCH=$(git rev-parse --abbrev-ref HEAD)
TAG=${COMMIT}

docker buildx build \
--push \
--build-arg=COMMIT=${COMMIT} \
--build-arg=BRANCH=${BRANCH} \
--platform linux/arm64,linux/amd64 \
-t pfcurtis/network-test:${TAG} -f Dockerfile .
