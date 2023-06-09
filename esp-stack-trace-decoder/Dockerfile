FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# cmake = required for 'addr-to-line' binary
RUN     apt-get update \
    &&  apt-get install -y \
            cmake \
            openjdk-8-jre \
            ca-certificates \
            curl \
            make

# Install Java Jar
RUN     mkdir -p /opt/esp-stack-trace-decoder/bin/ \
    &&  chmod 777 -R /opt/esp-stack-trace-decoder \
    &&  curl -O /opt/littleyoda/EspStackTraceDecoder/EspStackTraceDecoder.jar https://github.com/littleyoda/EspStackTraceDecoder/releases/download/untagged-59a763238a6cedfe0362/EspStackTraceDecoder.jar

ADD bin /opt/esp-stack-trace-decoder/bin

ENV PATH /opt/esp-stack-trace-decoder/bin:$PATH
