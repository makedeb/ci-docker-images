#!/usr/bin/env bash
set -e

# NOTE: This script needs to be ran from the root of the makedeb-docker
# repository to function correctly.

# Source functions
for i in "run_verbosely" "configure_docker"; do
  source ".drone/scripts/${i}.sh"
done

# Log in to ProGet server.
configure_docker

image="ci-image:${makedeb_version}"

target_dockerfile="Dockerfile"

# Setup image.
echo "[Info] Building '${image}' from '${source_image}'..."

if [[ ! -f "${target_dockerfile}" ]]; then
  echo "Unable to find dockerfile for ${image}"
  exit 1
fi

sed -i "1s|{{ image }}|${source_image}|" "./${target_dockerfile}"

published_image_path="${proget_server}/docker/makedeb/${image}"

# Build and publish image.
docker build --no-cache \
             --pull \
             -t "${published_image_path}" \
             -f "./${target_dockerfile}" \
	     --build-arg "hw_url=${hw_url}" \
             ./

docker push "${published_image_path}"
