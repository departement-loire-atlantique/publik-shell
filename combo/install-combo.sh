

################
# combo
################

set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL COMBO
apt-get update \
    && apt-get -t stretch-backports install -y --no-install-recommends python3-django python3-cryptography python3-pycryptodome \
    && apt-get install -y --no-install-recommends combo

# COMBO CONFIG
mkdir -p /etc/combo/settings.d/
cp $DIR/combo.settings.py /etc/combo/settings.d/loire-atlantique.py
cp $DIR/../secret /etc/combo && chmod 755 /etc/combo/secret

# NGINX CONFIG
cp $DIR/nginx-combo.template /etc/nginx/conf.d/combo.template

# USEFULL TO BE ABLE TO RUN THE MANAGER 
usermod combo -s /bin/bash