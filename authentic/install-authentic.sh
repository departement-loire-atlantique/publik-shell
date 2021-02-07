################
# authentic
################

set -eu
DIR_AUTHENTIK="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Authentic 2
apt update \
    && apt install -y python3-attr \
    && apt install -y authentic2-multitenant memcached

# CONFIGURE MODULES
mkdir -p /etc/authentic2-multitenant/settings.d/
cp $DIR_AUTHENTIK/authentic.settings.py /etc/authentic2-multitenant/settings.d/loire-atlantique.py
cp $DIR_AUTHENTIK/../secret /etc/authentic2-multitenant && chmod 755 /etc/authentic2-multitenant/secret

# CONFIGURE NGINX
cp $DIR_AUTHENTIK/nginx-authentic.template /etc/nginx/conf.d/authentic.template