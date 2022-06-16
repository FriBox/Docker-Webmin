#!/bin/bash
set -e

file_env() {
  local var="$1"
  local fileVar="${var}_FILE"
  local def="${2:-}"
  if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
    echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
    exit 1
  fi
  local val="$def"
  if [ "${!var:-}" ]; then
    val="${!var}"
  elif [ "${!fileVar:-}" ]; then
    val="$(< "${!fileVar}")"
  fi
  export "$var"="$val"
  unset "$fileVar"
}

file_env 'ROOT_PASSWORD'

ROOT_PASSWORD=${ROOT_PASSWORD:-password}

set_root_passwd() {
  echo "root:$ROOT_PASSWORD" | chpasswd
}

if [[ -z ${1} ]]; then
    set_root_passwd
    echo " <-- [ FriBox - Webmin Service ] --> "
    echo "====================================="
    echo "Starting Webmin Service ..."
    /usr/sbin/service webmin restart
else
  exec "$@"
fi
