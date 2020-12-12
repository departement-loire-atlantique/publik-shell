#!/bin/bash

# Fail on errors
set -eu
DIR_START_BIJOE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Wait for dependencies
$DIR_START_BIJOE/../base/subst-env.sh "bijoe"

service bijoe start
