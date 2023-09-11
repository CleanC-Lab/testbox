FROM docker:24-dind

ARG MSJDK_VERSION="17.0.8.1"
ARG JENKINS_AGENT_VERSION="3148.v532a_7e715ee3"

RUN apk add --no-cache \
      curl \
      wget \
      bash \
      git \
      git-lfs \
      musl-locales \
      openssh-client \
      openssl \
      procps \
      tzdata \
      tzdata-utils \
      qemu-aarch64 \
      socat \
    && rm -rf /tmp/*.apk /tmp/gcc /tmp/gcc-libs.tar* /tmp/libz /tmp/libz.tar.xz /var/cache/apk/*

# Install Java
RUN wget -O /opt/java.tar.gz "https://aka.ms/download-jdk/microsoft-jdk-${MSJDK_VERSION}-alpine-x64.tar.gz" \
 && mkdir -p /opt/java/openjdk \
 && cd /opt/java/openjdk \
 && tar xf /opt/java.tar.gz --strip-components=1 -C . \
 && rm -f /opt/java.tar.gz

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install jenkins agent
ADD "https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_AGENT_VERSION}/remoting-${JENKINS_AGENT_VERSION}.jar" /usr/share/jenkins/agent.jar
ADD ./jenkins-agent /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins-agent

ADD ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]
