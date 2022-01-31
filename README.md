# ci-docker-images
This repository contains the source for the Docker images used in [makedeb](/makedeb/makedeb)'s CI pipelines.

The images are built on top of the normal [makedeb Docker images](https://docs.makedeb.org/home/installing/docker/), with added dependencies needed in makedeb CI pipelines. Images are automatically built and republished nightly.

### Note
These images are not designed for the general public, as they have CI-specific dependencies and tools which usually are not used in regular makedeb usage.
Instead, use the normal [makedeb Docker images](https://docs.makedeb.org/home/installing/docker/).
