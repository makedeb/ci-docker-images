local buildCIImage(source_image, makedeb_version) = {
  name: "build-ci-image-" + makedeb_version,
  kind: "pipeline",
  type: "docker",
  volumes: [{name: "docker", host: {path: "/var/run/docker.sock"}}],
  steps: [{
    name: "build-and-publish-ci-" + target_tag,
    image: "docker",
    volumes: [{name: "docker", path: "/var/run/docker.sock"}],
    environment: {
      proget_api_key: {from_secret: "proget_api_key"},
      source_image: source_image,
      makedeb_version: makedeb_version,
    },
    commands: [
      "apk add --no-cache bash",
      ".drone/scripts/main.sh"
    ]
  }]
};


[
  buildCIImage("proget.hunterwittenborn.com/docker/makedeb/makedeb-alpha:ubuntu-focal", "alpha"),
  buildCIImage("proget.hunterwittenborn.com/docker/makedeb/makedeb-beta:ubuntu-focal", "beta"),
  buildCIImage("proget.hunterwittenborn.com/docker/makedeb/makedeb:ubuntu-focal", "stable")

]
