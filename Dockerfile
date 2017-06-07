FROM ubuntu:16.04
MAINTAINER "Joris MASSON" <joris.masson@enalean.com>

RUN apt-get update \
    && apt-get install -y \
        nodejs \
        npm \
        git \
        libfontconfig \
        rpm \
        expect \
    && apt-get clean

# This is used by bower to disable interactive mode
ENV CI true

# Disable cli progress animation in npm
RUN ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install --global npm \
    && npm config set progress false

## Install base node modules
RUN npm install --global \
        grunt-cli \
        bower \
        phantomjs-prebuilt

COPY run.sh /run.sh
COPY npm-login.sh /npm-login.sh

VOLUME ["/tuleap"]

ENTRYPOINT ["/run.sh"]
