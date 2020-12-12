#!/bin/bash

# Fail on errors
set -eu
DIR_START_WCS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR_START_WCS/../base/subst-env.sh "wcs"

service wcs start
