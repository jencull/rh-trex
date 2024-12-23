FROM registry.access.redhat.com/ubi9/ubi-minimal:9.5-1734497536

RUN \
    microdnf install -y \
    util-linux \
    && \
    microdnf clean all

COPY \
    * \
    /usr/local/bin/trex

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/trex", "serve"]
#ENTRYPOINT ["/bin/ls"]
#ENTRYPOINT ["python3", "-m", "http.server", "8000"]

LABEL name="trex" \
      vendor="Red Hat" \
      version="0.0.1" \
      summary="rh-trex API" \
      description="rh-trex API"
      