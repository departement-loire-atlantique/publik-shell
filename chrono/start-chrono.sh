#!/bin/bash

# Fail on errors
set -eu
DIR_START_CHRONO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Wait for dependencies
$DIR_START_CHRONO/../base/subst-env.sh "chrono"

service chrono start
