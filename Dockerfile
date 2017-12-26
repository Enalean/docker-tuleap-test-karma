FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        git \
        chromium-browser \
        ca-certificates \
        curl \
        apt-transport-https \
    && curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && echo "deb https://deb.nodesource.com/node_6.x xenial main" > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean \
    && npm install --global npm@5.5.1 \
    && npm config set progress false

# This is used by bower to disable interactive mode
ENV CI true

COPY run.sh /run.sh

VOLUME ["/sources"]

RUN groupadd -r test-runner && useradd --create-home -r -g test-runner test-runner \
    && mkdir /output && chown -R test-runner:test-runner /output

USER test-runner

ENTRYPOINT ["/run.sh"]
