FROM docker:28-dind

ARG TEMURIN_VERSION="21.0.7+6"
ARG JENKINS_AGENT_VERSION="3309.v27b_9314fd1a_4"

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

# Configure JAVA_HOME and PATH
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install Java
RUN wget -O /opt/java.tar.gz "https://github.com/adoptium/temurin21-binaries/releases/download/jdk-${TEMURIN_VERSION}/OpenJDK21U-jdk_x64_alpine-linux_hotspot_$(echo ${TEMURIN_VERSION} | sed 's/+/_/g').tar.gz" \
 && mkdir -p /opt/java/openjdk \
 && cd /opt/java/openjdk \
 && tar xf /opt/java.tar.gz --strip-components=1 -C . \
 && rm -f /opt/java.tar.gz \
 && echo "Testing java..." && java --version

# Install jenkins agent
ADD "https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_AGENT_VERSION}/remoting-${JENKINS_AGENT_VERSION}.jar" /usr/share/jenkins/agent.jar
ADD ./jenkins-agent /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins-agent

ADD ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]
