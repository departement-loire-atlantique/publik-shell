

################
# wcs
################

set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL WCS 
apt-get update \
    && apt-get install -y --no-install-recommends \
       libreoffice \
       wcs-au-quotidien \
       python3-dns

# CONFIGURE MODULES
mkdir -p /var/lib/wcs/skeletons
cp $DIR/wcs.settings.py /etc/wcs/settings.d/loire-atlantique.py

# NGINX CONF FOR PUBLIC
cp $DIR/nginx-wcs.template /etc/nginx/conf.d/wcs.template

# This user is required to use combo-manage
usermod wcs -s /bin/bash