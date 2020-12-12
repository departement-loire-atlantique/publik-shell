#!/bin/bash

# Fail on errors
set -eu
DIR_START_COMBO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Wait for dependencies
$DIR_START_COMBO/../base/subst-env.sh "combo"

service combo start
