#!/bin/bash
export DOCKER_HOST=unix:///var/run/docker.sock

LAUNCH_DIND=false

if [ ! -e /var/run/docker.sock ]; then
    echo 'Docker socket is not forwarded.'
    LAUNCH_DIND=true
else
    # Test docker.sock using socat
    socat -u OPEN:/dev/null UNIX-CONNECT:/var/run/docker.sock
    if [ "$?" != '0' ]; then
        echo 'Docker socket exists but not responding. Maybe container restart?'
        LAUNCH_DIND=true
    fi
fi

if [ "$LAUNCH_DIND" == 'true' ]; then
    echo "Cannot communicate with docker. Launching Docker in Docker..."
    /usr/local/bin/dockerd-entrypoint.sh dockerd &
else
    echo "Can communicate with docker. Using given docker socket."
fi

exec /usr/local/bin/jenkins-agent
