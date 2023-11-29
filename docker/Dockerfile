ARG VERSION=24
FROM docker:${VERSION}

RUN apk add --no-cache python3 curl which bash

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

RUN curl -L --output /usr/bin/gh-fetch https://github.com/gruntwork-io/fetch/releases/download/v0.4.6/fetch_linux_amd64 \
 && chmod 755 /usr/bin/gh-fetch
