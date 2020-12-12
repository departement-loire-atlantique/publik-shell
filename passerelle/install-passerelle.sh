################
# passerelle
################

set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL PUBLIK 
apt-get update \
    && apt-get install -y --no-install-recommends passerelle

# CONFIGURE MODULES
mkdir -p /etc/passerelle/settings.d/ 
cp $DIR/passerelle.settings.py /etc/passerelle/settings.d/loire-atlantique.py

# NGINX CONF FOR PUBLIC
cp $DIR/nginx-passerelle.template /etc/nginx/conf.d/passerelle.template

# USEFULL TO BE ABLE TO USE THE MANAGER 
usermod passerelle -s /bin/bash