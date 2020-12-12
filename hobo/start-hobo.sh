#!/bin/bash

# Fail on errors
set -eu
DIR_START_HOBO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR_START_HOBO/../configure.env

$DIR_START_HOBO/../base/subst-env.sh "hobo"

envsubst '${EMAIL} ${ENV} ${DOMAIN} ${HTTPS_PORT} ${DB_WCS_PASS} ${DB_WCS_USER} $COMBO_SUBDOMAIN' < /tmp/config.template > /tmp/config.json
envsubst '${EMAIL} ${ENV} ${DOMAIN} ${HTTPS_PORT} $AUTHENTIC_SUBDOMAIN $COMBO_SUBDOMAIN $COMBO_ADMIN_SUBDOMAIN $FARGO_SUBDOMAIN $HOBO_SUBDOMAIN $PASSERELLE_SUBDOMAIN $WCS_SUBDOMAIN $CHRONO_SUBDOMAIN $BIJOE_SUBDOMAIN' < /tmp/cook.sh.template > /tmp/cook.sh
envsubst '${EMAIL} ${ENV} ${DOMAIN} ${HTTPS_PORT} ${SUPERUSER_PASS} $AUTHENTIC_SUBDOMAIN $COMBO_SUBDOMAIN $COMBO_ADMIN_SUBDOMAIN $FARGO_SUBDOMAIN $HOBO_SUBDOMAIN $PASSERELLE_SUBDOMAIN $WCS_SUBDOMAIN $CHRONO_SUBDOMAIN $BIJOE_SUBDOMAIN' < /tmp/hobo.recipe.template > /tmp/recipe.json
chmod +x /tmp/cook.sh

# Start NGINX
service nginx start

# Start HOBO service
service hobo restart

# Start HOBO Agent
service supervisor start
