FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN     apt-get update \
    &&  apt-get install -y \
            nano \
            apt-transport-https \
            ca-certificates \
            curl \
            ansible \
            ansible-lint \
            openssh-client \
            iputils-ping \
            gnupg \
            apt-utils \
            rsync \
            git \
            make

# Install ansible additions
RUN     ansible-galaxy collection install community.general

RUN     mkdir -p ~/.ssh \
    &&  chmod 700 ~/.ssh

# Install Dopper CLI
RUN     curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | apt-key add - \
    &&  echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | tee /etc/apt/sources.list.d/doppler-cli.list \
    &&  apt-get update \
    &&  apt-get install -y doppler
