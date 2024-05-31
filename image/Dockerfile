FROM ubuntu:24.04

LABEL maintainer="Antonio Neri <antoneri@proton.me>" \
      description="Micro: A minimal base image derived from Ubuntu 24.04, optimized for lightweight and efficient container deployments."

ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

# Copy resources
COPY container /container

# Build
RUN /container/prerequirements.sh && \
    /container/services.sh && \
    /container/utilities.sh && \
    /container/cleanup.sh && \
    rm -f /container/cleanup.sh
    
CMD ["/sbin/minit"]