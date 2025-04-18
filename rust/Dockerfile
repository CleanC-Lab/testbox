ARG VERSION=1.86.0-slim-bookworm
FROM rust:${VERSION}

RUN apt update \
 && apt install ca-certificates curl gnupg pkg-config libssl-dev protobuf-compiler git python3 python3-full python3-pip wget -y \
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

# Add clippy and rustfmt
RUN rustup component add rustfmt \
 && rustup component add clippy

# Handy helper utility for GH release handling
RUN wget -O - https://github.com/github-release/github-release/releases/download/v0.10.0/linux-amd64-github-release.bz2 | bzcat > /usr/bin/github-release \
 && chmod 755 /usr/bin/github-release

RUN cargo install cargo-nextest \
 && cargo install cargo-machete \
 && cargo install cargo-hack \
 && cargo install typos-cli \
 && rm -rf /usr/local/cargo/registry
