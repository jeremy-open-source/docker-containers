#!/usr/bin/env bash

set -e

ELF_FILE=${1:-${ELF_FILE:-"firmware.elf"}}
EXCEPTION_FILE=${2:-${EXCEPTION_FILE:-"dump.txt"}}
ADDR_2_LINE_BIN="/usr/bin/addr2line"
ESP_STACK_TRACE_DECODER="/opt/esp-stack-trace-decoder/bin/EspStackTraceDecoder.jar"

java -jar "${ESP_STACK_TRACE_DECODER}" \
          "${ADDR_2_LINE_BIN}" \
          "${ELF_FILE}" \
          "${EXCEPTION_FILE}"
