ARG VERSION=22
FROM node:${VERSION}

RUN apt-get update && \
    apt-get install -y python3 curl bash xz-utils && \
    rm -rf /var/lib/apt/lists/*
RUN curl https://nodejs.org/dist/v22.14.0/node-v22.14.0-linux-x64.tar.xz > /tmp/node-v22.14.0-linux-x64.tar.xz
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

RUN mkdir -p /usr/local/node \
  && tar -C /usr/local/node -xf /tmp/node-v22.14.0-linux-x64.tar.xz

# Installing nodejs and npm
# RUN apt-get install -y nodejs npm

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
ENV PATH $PATH:/usr/local/node/node-v22.14.0-linux-x64/bin

# Installing firebase cli
#RUN npm install -g firebase-tools
#RUN chmod +x /usr/local/node/node-v22.14.0-linux-x64/bin/firebase

RUN bash
