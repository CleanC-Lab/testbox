ARG VERSION=1.72.0-slim-bookworm
FROM rust:${VERSION}

RUN apt update \
 && apt install ca-certificates curl gnupg pkg-config libssl-dev protobuf-compiler python3 python3-full python3-pip -y \
 && rm -rf /var/lib/apt/lists/*

RUN install -m 0755 -d /etc/apt/keyrings \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
 && chmod a+r /etc/apt/keyrings/docker.gpg \
 && echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null \
 && apt update \
 && apt install docker-ce-cli -y \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages reuse # Hey, it is a docker container, so... it does not damage so much.

RUN cargo install cargo-nextest
