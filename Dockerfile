# Build Markdown-PP Container
FROM geoffh1977/python3:latest
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