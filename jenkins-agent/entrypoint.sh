#!/bin/bash
export DOCKER_HOST=unix:///var/run/docker.sock

# Test docker.sock using socat
socat -u OPEN:/dev/null UNIX-CONNECT:/var/run/docker.sock

if [ "$?" != '0' ]; then
    echo "Docker socket is not forwarded. Spawning docker..."
    /usr/local/bin/dockerd-entrypoint.sh dockerd &
else
    echo "Forwarded docker socket detected. Using host docker container..."
fi

exec /usr/local/bin/jenkins-agent
