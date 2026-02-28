#!/bin/bash

# Change to the directory of the script
cd "$(dirname "$0")"

# Allow docker to use X11
xhost +local:docker

# Build the container
CURRENT_UID=$(id -u) CURRENT_GID=$(id -g) docker compose build

# Run the container via docker compose
# Pass the UID and GID to the container so that files created are owned by the current user
# You might need to adjust the JNLP file name if it's not 'launch.jnlp'
# We use /work/launch.jnlp as default because it's mounted inside the container
CURRENT_UID=$(id -u) CURRENT_GID=$(id -g) DISPLAY=$DISPLAY docker compose run --rm app "${@:-/work/launch.jnlp}"
