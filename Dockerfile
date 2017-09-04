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
    && npm install --global npm@5.3.0 \
    && npm config set progress false

COPY run.sh /run.sh

VOLUME ["/tuleap"]

ENTRYPOINT ["/run.sh"]
