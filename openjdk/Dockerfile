FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

RUN apt-get update && \
    apt-get install -y python3 curl bash && \
    rm -rf /var/lib/apt/lists/*
RUN curl https://nodejs.org/dist/v21.1.0/node-v21.1.0-linux-x64.tar.xz > /tmp/node-v21.1.0-linux-x64.tar.xz
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

RUN mkdir -p /usr/local/node \
  && tar -C /usr/local/node -xvf /tmp/node-v21.1.0-linux-x64.tar.xz

# Installing nodejs and npm
# RUN apt-get install -y nodejs npm

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
ENV PATH $PATH:/usr/local/node/node-v21.1.0-linux-x64/bin

# Installing firebase cli
RUN npm install -g firebase-tools
RUN chmod +x /usr/local/node/node-v21.1.0-linux-x64/bin/firebase

RUN bash