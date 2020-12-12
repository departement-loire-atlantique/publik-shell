################
# fargo
################

set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL FARGO 
# + python3 backports needed for fargo
apt-get update \
    && apt-get -t stretch-backports install -y python3-django python3-django-mellon python3-django-filters \
    && apt-get install -y --no-install-recommends fargo

# CONFIGURE MODULES
mkdir -p /etc/fargo/settings.d/
cp $DIR/fargo.settings.py /etc/fargo/settings.d/loire-atlantique.py
cp $DIR/../secret /etc/fargo
chmod 755 /etc/fargo/secret

# NGINX CONF FOR PUBLIC
cp $DIR/nginx-fargo.template /etc/nginx/conf.d/fargo.template

# USEFULL TO BE ABLE TO USE THE MANAGER 
usermod fargo -s /bin/bash