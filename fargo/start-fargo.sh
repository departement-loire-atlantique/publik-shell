#!/bin/bash

# Fail on errors
set -eu
DIR_START_FARGO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR_START_FARGO/../base/subst-env.sh "fargo"

service fargo start
