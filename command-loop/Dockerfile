FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN     apt-get update \
    &&  apt-get install -y \
            nmap \
            iputils-ping \
            curl \
            wget \
            make \
            nano

COPY bin/* /usr/local/sbin/

WORKDIR /

ENTRYPOINT ["command-loop.sh"]
