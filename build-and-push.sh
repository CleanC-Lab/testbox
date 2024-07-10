#!/bin/bash

IMAGE_NAMESPACE="ghcr.io/cleanc-lab"

MSJDK_VERSION="17.0.10"
JENKINS_AGENT_VERSION="3256.v88a_f6e922152"
RUST_VERSION="1.79.0"

function docker-build () {
    docker build -t "${IMAGE_NAMESPACE}/${PWD##*/}:latest" -t "${IMAGE_NAMESPACE}/${PWD##*/}:${VERSION}" $* .
}

function docker-push () {
    docker push "${IMAGE_NAMESPACE}/${PWD##*/}:latest"
    docker push "${IMAGE_NAMESPACE}/${PWD##*/}:${VERSION}"
}

set -e

pushd jenkins-agent
VERSION="$JENKINS_AGENT_VERSION"
docker-build --build-arg JENKINS_AGENT_VERSION="$JENKINS_AGENT_VERSION" --build-arg MSJDK_VERSION="$MSJDK_VERSION"
docker-push
popd

pushd rust
VERSION="$RUST_VERSION-slim-bookworm"
docker-build --build-arg VERSION="$VERSION"
docker-push
popd

pushd docker
VERSION="26"
docker-build --build-arg VERSION="$VERSION"
docker-push
popd

pushd openjdk
VERSION="17"
docker-build
docker-push
popd
