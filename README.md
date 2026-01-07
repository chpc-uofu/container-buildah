# Buildah Image

[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Release](https://github.com/CHPC-UofU/container-buildah/actions/workflows/release.yml/badge.svg)](https://github.com/CHPC-UofU/container-buildah/actions/workflows/release.yml)

A custom container image based on [quay.io/buildah/stable](https://quay.io/repository/buildah/stable).

## Image Tags

* `latest`: Latest stable version of Buildah.

## How to Build

This image is built on GitHub automatically any time a commit is made or merged to the `main` branch and tagged. But if you need to build the image on your own locally, do the following:

1. Install [Podman](https://podman.io/getting-started/installation) or [Docker](https://docs.docker.com/get-docker/).
    * In the commands below, `podman` may be interchanged with `docker` depending on your choice.
2. `cd` into the directory containing this repository.
3. Build the image:

   ```shell
   podman build --file Containerfile --tag container-buildah .   
   ```

## How to Use

1. Install [Podman](https://podman.io/getting-started/installation) or [Docker](https://docs.docker.com/get-docker/).
    * In the commands below, `podman` may be interchanged with `docker` depending on your choice.
1. Pull this image from GitHub (or use the image you built above `container-buildah:latest`):

   ```shell
   podman pull ghcr.io/chpc-uofu/container-buildah:latest
   ```
1. Run a container from the image:

   ```shell
   podman run -it ghcr.io/chpc-uofu/container-buildah:latest
   ```

## How to Contribute

1. Submit a pull request against `main`.
1. Once the automated status checks pass, complete the pull request by squash-merging with `main`.
1. Apply a [semantic version](https://semver.org/) tag to the resulting commit (e.g. `v1.0.1`).
1. At this point the automatic image build on GitHub will trigger, tagging the new image with the semantic version and `latest`.

## Author

CHPC Staff

## Additional Resources

* [Tutorial: Use Buildah in a rootless container with GitLab Runner Operator on OpenShift](https://docs.gitlab.com/ci/docker/buildah_rootless_tutorial/)
