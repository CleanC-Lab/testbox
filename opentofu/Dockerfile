FROM docker.io/alpine:3.20 AS tofu

ADD install-opentofu.sh /install-opentofu.sh
RUN chmod +x /install-opentofu.sh
RUN apk add gpg gpg-agent
ENV OPENTOFU_VERSION=1.9
RUN ./install-opentofu.sh --install-method standalone --install-path / --symlink-path -

## This is your stage:
FROM docker.io/debian:bookworm
COPY --from=tofu /tofu /usr/local/bin/tofu

# Add your commands here
