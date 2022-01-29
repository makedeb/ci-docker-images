FROM {{ image }}
ARG hw_url

RUN sudo apt-get update
RUN sudo apt-get dist-upgrade -y
RUN sudo apt-get install tzdata git jq sudo sed ubuntu-dev-tools debhelper asciidoctor bats python3 python3-requests gpg openssh-client -y
RUN curl -Ls "https://shlink.${hw_url}/ci-utils" | sudo bash -

WORKDIR /home/makedeb
ENTRYPOINT "/bin/bash"
