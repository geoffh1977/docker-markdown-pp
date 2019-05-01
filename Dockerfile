# Build Markdown-PP Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=python3
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

# Install Markdown PP
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade markdownpp && \
    mkdir -p /input /output && \
    chown "${ALPINE_USER}":"${ALPINE_USER}" /input /output

VOLUME ["/input"]
WORKDIR /input
USER ${ALPINE_USER}
CMD ["markdown-pp"]