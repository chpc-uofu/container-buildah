# syntax=docker/dockerfile:1
FROM quay.io/buildah/stable:v1.42.2

# Image build arguments:
ARG imageversion="localdev"

# Labels
LABEL org.opencontainers.image.authors="UofU CHPC <helpdesk@chpc.utah.edu>"
LABEL org.opencontainers.image.description="A custom container image based on quay.io/podman/stable."
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="container-podman"
LABEL org.opencontainers.image.url="https://github.com/chpc-uofu/container-podman"
LABEL org.opencontainers.image.vendor="chpc.utah.edu"
LABEL org.opencontainers.image.version=${imageversion}

# Set up subuid and subgid
RUN echo -e "root:1:65535\nbuild:1:999\nbuild:1001:65535" > /etc/subuid && \
    echo -e "root:1:65535\nbuild:1:999\nbuild:1001:65535" > /etc/subgid

# Use chroot because the default runc does not work when running rootless
RUN echo "export BUILDAH_ISOLATION=chroot" >> /home/build/.bashrc

# The buildah container will run as `build` user
USER build
WORKDIR /home/build
