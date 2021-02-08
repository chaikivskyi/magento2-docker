#!/bin/bash

if [ ! -f "magento.crt" ] || [! -f "magento.key"]; then
    mkcert -cert-file magento.crt -key-file magento.key "$HOSTNAME" && mkcert -install
fi
