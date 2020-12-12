#!/bin/bash

# Fail on errors
set -eu
DIR_START_AUTHENTIC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Wait for dependencies
$DIR_START_AUTHENTIC/../base/subst-env.sh "authentic"

# Start MEMCACHED
service memcached start

# Start Authentic
service authentic2-multitenant restart
