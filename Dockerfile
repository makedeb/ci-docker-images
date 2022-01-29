FROM {{image}}

RUN sudo apt-get update
RUN sudo apt-get dist-upgrade -y
RUN sudo apt-get install tzdata git jq sudo sed ubuntu-dev-tools debhelper asciidoctor bats python3 python3-requests gpg openssh-client -y
RUN curl -Ls \"https://shlink.hunterwittenborn.com/ci-utils\" | sudo bash -
RUN sudo apt-get upgrade jq git -y

WORKDIR /home/makedeb
ENTRYPOINT "/bin/bash"
