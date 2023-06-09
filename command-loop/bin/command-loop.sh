#!/usr/bin/env bash

# Check if first argument is provided
if [ -z "$@" ]; then
    echo "Error: No argument"
    exit 1
fi

# Run eval in a loop
while true; do
    eval $@
done
