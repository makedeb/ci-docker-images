local buildImage(source_image, target-tag, makedeb_version) = {
  name: "build-image-" + target_tag,
  kind: "pipeline",
  type: "docker",
  volumes: [{name: "docker", host: {path: "/var/run/docker.sock"}}],
  steps: [{
    name: "build-and-publish-" + target_tag,
    image: "docker",
    volumes: [{name: "docker", path: "/var/run/docker.sock"}],
    environment: {
      proget_api_key: {from_secret: "proget_api_key"},
      source_image: source_image,
      target_tag: target_tag,
      makedeb_version: makedeb_version,
    },
    commands: [
      "apk add --no-cache bash",
      ".drone/scripts/main.sh"
    ]
  }]
};


[
  buildImage("proget.hunterwittenborn.com/docker/makedeb/makedeb-alpha", "utests", "alpha"),
  buildImage("proget.hunterwittenborn.com/docker/makedeb/makedeb-beta", "utests", "beta"),
  buildImage("proget.hunterwittenborn.com/docker/makedeb/makedeb", "utests", "stable")
]
