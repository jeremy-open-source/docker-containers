#!/bin/sh
set -e

# Default sensible HOME inside container when running with arbitrary UID
: "${HOME:=/work/home}"
export HOME

# Respect XDG if provided, else base them on HOME
: "${XDG_CONFIG_HOME:=${HOME}/.config}"
: "${XDG_CACHE_HOME:=${HOME}/.cache}"
export XDG_CONFIG_HOME XDG_CACHE_HOME

# Create HOME and icedtea-web expected dirs so it doesn't resolve to '?/...'
mkdir -p "${HOME}" \
         "${XDG_CONFIG_HOME}/icedtea-web/security" \
         "${XDG_CONFIG_HOME}/icedtea-web" \
         "${XDG_CACHE_HOME}/icedtea-web/cache" \
         "${XDG_CACHE_HOME}/icedtea-web/tmp" \
         "${XDG_CACHE_HOME}/icedtea-web/pcache" \
         "${XDG_CONFIG_HOME}/icedtea-web/log"

# Best effort: adjust ownership to current uid/gid (may already match)
if command -v id >/dev/null 2>&1; then
  UID_CUR=$(id -u 2>/dev/null || echo 0)
  GID_CUR=$(id -g 2>/dev/null || echo 0)
  chown -R "$UID_CUR":"$GID_CUR" "${HOME}" 2>/dev/null || true
fi

# Pass through to javaws
exec /usr/bin/javaws "$@"
