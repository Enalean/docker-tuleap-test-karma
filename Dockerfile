FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nodejs \
        npm \
        git \
        chromium-browser \
        ca-certificates \
    && apt-get clean

# This is used by bower to disable interactive mode
ENV CI true

# Disable cli progress animation in npm
RUN ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install --global npm@5.5.1 \
    && npm config set progress false

COPY run.sh /run.sh

VOLUME ["/sources"]

RUN groupadd -r test-runner && useradd --create-home -r -g test-runner test-runner \
    && mkdir /output && chown -R test-runner:test-runner /output

USER test-runner

ENTRYPOINT ["/run.sh"]
