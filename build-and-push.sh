#!/bin/bash

IMAGE_NAMESPACE="ghcr.io/cleanc-lab"

TEMURIN_VERSION="21.0.7+6"
JENKINS_AGENT_VERSION="3309.v27b_9314fd1a_4"
RUST_VERSION="1.86.0"

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
docker-build --build-arg JENKINS_AGENT_VERSION="$JENKINS_AGENT_VERSION" --build-arg TEMURIN_VERSION="$TEMURIN_VERSION"
docker-push
popd

pushd rust
VERSION="$RUST_VERSION-slim-bookworm"
docker-build --build-arg VERSION="$VERSION"
docker-push
popd

pushd docker
VERSION="27"
docker-build --build-arg VERSION="$VERSION"
docker-push
popd

pushd openjdk
VERSION="17"
docker-build
docker-push
popd

pushd opentofu
VERSION="1.9"
docker-build
docker-push
popd

pushd node
VERSION="22"
docker-build --build-arg VERSION="$VERSION"
docker-push
popd
