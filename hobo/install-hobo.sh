################
# hobo
################

set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL HOBO (without postgresql)
apt-get update \
    && apt-get install -y --no-install-recommends hobo publik-base-theme

# COPY conf files
cp $DIR/site-options.cfg /tmp/
cp $DIR/*.template /tmp/
mkdir -p /etc/hobo/settings.d/

cp $DIR/hobo.settings.py /etc/hobo/settings.d/loire-atlantique.py

# NGINX CONF FOR PUBLIC
cp $DIR/nginx-hobo.template /etc/nginx/conf.d/hobo.template

# This user is required to use hobo-manage
usermod hobo -s /bin/bash