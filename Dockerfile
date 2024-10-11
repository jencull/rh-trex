FROM registry.access.redhat.com/ubi9/ubi-minimal:9.2-750.1697534106

RUN microdnf install -y util-linux && microdnf clean all

# Ensure /usr/local/bin/rh-trex is created as a directory
RUN mkdir -p /usr/local/bin/rh-trex && ls -l /usr/local/bin

# Copy all files in the current directory into /usr/local/bin/rh-trex/
COPY . /usr/local/bin/rh-trex/

# Print the contents of /usr/local/bin/rh-trex/ to verify the copy worked
RUN ls -l /usr/local/bin/rh-trex/

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/rh-trex/serve"]

LABEL name="trex" \
      vendor="Red Hat" \
      version="0.0.1" \
      summary="rh-trex API" \
      description="rh-trex API"
