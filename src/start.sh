#!/usr/bin/env bash
set -e

envsubst '$DOMAIN' < $PWD/nginx.template > $PWD/nginx.conf && cat $PWD/nginx.conf

nginx -c "$PWD/nginx.conf"

wait -n
