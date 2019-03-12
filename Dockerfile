FROM ubuntu:18.04

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        nodejs \
        npm \
        git \
        chromium-browser \
        ca-certificates \
    && apt-get clean \
    && npm install --global npm@6.9.0 \
    && npm config set progress false

COPY run.sh /run.sh

VOLUME ["/sources"]

RUN groupadd -r test-runner && useradd --create-home -r -g test-runner test-runner \
    && mkdir /output && chown -R test-runner:test-runner /output

USER test-runner

ENTRYPOINT ["/run.sh"]
