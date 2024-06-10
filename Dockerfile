ARG UPSTREAM_VERSION

FROM ghcr.io/paradigmxyz/reth:${UPSTREAM_VERSION}

RUN apt update && apt install curl -y
USER root

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
