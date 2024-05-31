FROM ubuntu:24.04

LABEL maintainer="Antonio Neri <antoneri@proton.me>" \
      description="micro: Tiny But Mighty"

# Copy resources
COPY container /container
RUN find /container -type f -name "*.sh" -exec chmod +x {} \;

# Build
SHELL ["/bin/bash", "-c"]
RUN /container/build.sh \
    && rm -f /container/build.sh

ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

CMD ["/sbin/minit"]