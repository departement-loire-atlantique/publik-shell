################
# hobo
################

set -eu
DIR_HOBO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL HOBO (without postgresql)
apt update \
    && apt install -y --no-install-recommends supervisor hobo-agent hobo publik-base-theme

# COPY conf files
cp $DIR_HOBO/site-options.cfg /tmp/
cp $DIR_HOBO/*.template /tmp/
mkdir -p /etc/hobo/settings.d/
mkdir -p /etc/hobo-agent/settings.d

cp $DIR_HOBO/hobo.settings.py /etc/hobo/settings.d/loire-atlantique.py

# NGINX CONF FOR PUBLIC
cp $DIR_HOBO/nginx-hobo.template /etc/nginx/conf.d/hobo.template

# This user is required to use hobo-manage
usermod hobo -s /bin/bash

envsubst '$RABBITMQ_DEFAULT_USER $RABBITMQ_DEFAULT_PASS $RABBITMQ_PORT' < $DIR_HOBO/hobo-agent.settings.template > /etc/hobo-agent/settings.d/broker.py