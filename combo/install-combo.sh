

################
# combo
################

set -eu
DIR_COMBO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL COMBO
apt update \
    && apt install -y --no-install-recommends python3-django python3-cryptography python3-pycryptodome \
    && apt install -y --no-install-recommends combo

# COMBO CONFIG
mkdir -p /etc/combo/settings.d/
cp $DIR_COMBO/combo.settings.py /etc/combo/settings.d/loire-atlantique.py
cp $DIR_COMBO/../secret /etc/combo && chmod 755 /etc/combo/secret

# NGINX CONFIG
cp $DIR_COMBO/nginx-combo.template /etc/nginx/conf.d/combo.template

# USEFULL TO BE ABLE TO RUN THE MANAGER 
usermod combo -s /bin/bash