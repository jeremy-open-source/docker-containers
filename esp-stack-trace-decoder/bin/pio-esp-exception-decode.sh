#!/usr/bin/env bash

set -e

PIO_PROJECT=${1:-${PIO_PROJECT:-""}}

if [[ -z "${PIO_PROJECT}" ]]; then
  read -r -p "PIO PROJECT (ENV such as 'esp01_1m'): " PIO_PROJECT
fi

ELF_FILE=".pio/build/${PIO_PROJECT}/firmware.elf"
EXCEPTION_FILE=${2:-${EXCEPTION_FILE:-"dump.txt"}}

esp-exception-decode.sh "${ELF_FILE}" "${EXCEPTION_FILE}"
