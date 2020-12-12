

################
# chrono
################

set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL CHRONO
apt-get update \
    && apt-get install -y --no-install-recommends chrono

# CHRONO CONFIG
mkdir -p /etc/chrono/settings.d/
cp $DIR/chrono.settings.py /etc/chrono/settings.d/loire-atlantique.py
cp $DIR/../secret /etc/chrono && chmod 755 /etc/chrono/secret

# NGINX CONFIG
cp $DIR/nginx-chrono.template /etc/nginx/conf.d/chrono.template

# USEFULL TO BE ABLE TO RUN THE MANAGER 
usermod chrono -s /bin/bash