#!/usr/bin/env bash

set -eu
DIR_SUBST_ENV="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR_SUBST_ENV/../configure.env

export APPNAME=$1
envsubst '${ENV} ${DOMAIN} $AUTHENTIC_SUBDOMAIN $COMBO_SUBDOMAIN $COMBO_ADMIN_SUBDOMAIN $FARGO_SUBDOMAIN $HOBO_SUBDOMAIN $PASSERELLE_SUBDOMAIN $WCS_SUBDOMAIN $CHRONO_SUBDOMAIN $BIJOE_SUBDOMAIN' < "/etc/nginx/conf.d/$1.template" > "/etc/nginx/conf.d/$1.conf"