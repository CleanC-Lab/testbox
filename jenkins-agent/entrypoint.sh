#!/bin/bash
export DOCKER_HOST=unix:///var/run/docker.sock

if [ ! -e /var/run/docker.sock ]; then
    echo "Docker socket is not forwarded. Spawning docker..."
    /usr/local/bin/dockerd-entrypoint.sh dockerd &
else
    echo "Forwarded docker socket detected. Using host docker container..."
fi

exec /usr/local/bin/jenkins-agent
