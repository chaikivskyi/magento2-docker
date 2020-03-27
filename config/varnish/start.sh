#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -a :80 -F\
  -P /run/varnishd.pid \
  -T localhost:6082 \
  -f /etc/varnish/default.vcl \
  -S /etc/varnish/secret \
  -s malloc,1G"
