!#/usr/bin/env bash

# burpreqproxy.sh
# Enables or Disables the environment variables for proxing Python Requests module thru a running Burp Suite container.
# Version: 1.0
# Author: SavSanta (Ru Uba)

# TODO: Configure it to be looser in setting the proxy and/or SSL certificate.

PPATH="http://127.0.0.1:8080"
CERTPATH="~/.ssh/burpcert.pem"

function burpquests()
{

if mode -eq "on"
    export HTTP_PROXY=$PPATH
    export HTTPS_PROXY=$PPATH
    export REQUESTS_CA_BUNDLE=$CERTPATH
elif mode -eq "off"
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset REQUESTS_CA_BUNDLE
else
    echo "undesigned usage or error"
fi



}
