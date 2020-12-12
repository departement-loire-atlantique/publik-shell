#!/bin/bash

# Fail on errors
set -eu
DIR_START_PASSERELLE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR_START_PASSERELLE/../base/subst-env.sh "passerelle"

service passerelle start