#!/bin/bash

# Fail on errors
set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

service wcs stop

# Pause 2 seconds
sleep 2