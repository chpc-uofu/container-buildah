# syntax=docker/dockerfile:1
FROM quay.io/buildah/stable:v1.43.4

# Image build arguments:
ARG imageversion="localdev"

# Use chroot because the default runc does not work when running rootless
ENV BUILDAH_ISOLATION=chroot
# Do not start with user namespace
ENV _BUILDAH_STARTED_IN_USERNS=""
# Use VFS because fuse does not work
ENV STORAGE_DRIVER=vfs

# Labels
LABEL org.opencontainers.image.authors="UofU CHPC <helpdesk@chpc.utah.edu>"
LABEL org.opencontainers.image.description="A custom container image based on quay.io/podman/stable."
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="container-buildah"
LABEL org.opencontainers.image.url="https://github.com/chpc-uofu/container-buildah"
LABEL org.opencontainers.image.vendor="chpc.utah.edu"
LABEL org.opencontainers.image.version=${imageversion}

# Set up subuid and subgid
RUN echo -e "root:1:65536\nbuild:1:999\nbuild:1001:65536" > /etc/subuid && \
    echo -e "root:1:65536\nbuild:1:999\nbuild:1001:65536" > /etc/subgid

# The buildah container will run as `build` user
USER build
WORKDIR /home/build
