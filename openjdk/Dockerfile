FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

RUN apt-get update && \
    apt-get install -y python3 curl bash && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# Installing firebase
RUN curl -sL https://firebase.tools | bash

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin