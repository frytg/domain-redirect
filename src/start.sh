#!/usr/bin/env bash
set -e

envsubst < $PWD/nginx.template > $PWD/nginx.conf &
nginx -c "$PWD/nginx.conf"

wait -n
