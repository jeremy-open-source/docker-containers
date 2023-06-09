# ESP Stack Trace Decoder Dockerization

Dockerization of https://github.com/littleyoda/EspStackTraceDecoder

Docker container to run the ESP exception decoder binary.
It also includes some scripts to make it easier to run (see bin/).

## [Example script](https://gitlab.com/mage-sauce/programs/nix-tools/-/blob/f2f9c630bb4f2fc08d5736a6e2b50090900187d1/bin/js-mcu-esp-exception-decode-pio.sh)

```shell
#!/usr/bin/env bash

set -e

DOCKER_IMAGE="registry.gitlab.com/mage-sauce/dockerization/esp-stack-trace-decoder-docker:latest"

PIO_PROJECT=${1:-${PIO_PROJECT:-""}}
EXCEPTION_FILE=${2:-${EXCEPTION_FILE:-"dump.txt"}}

docker run \
  --rm \
  -it \
  --user $(id -u):$(id -g) \
  -e HOME=$HOME \
  --volume /etc/passwd:/etc/passwd:ro \
  --volume /etc/group:/etc/group:ro \
  --volume ${HOME}:${HOME} \
  --volume ${PWD}:${PWD} \
  --workdir="${PWD}" \
  ${DOCKER_IMAGE} \
  bash -c "pio-esp-exception-decode.sh \"${PIO_PROJECT}\" \"${EXCEPTION_FILE}\""
```
