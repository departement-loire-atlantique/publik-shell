

################
# chrono
################

set -eu
DIR_CHRONO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL CHRONO
apt update \
    && apt install -y --no-install-recommends chrono

# CHRONO CONFIG
mkdir -p /etc/chrono/settings.d/
cp $DIR_CHRONO/chrono.settings.py /etc/chrono/settings.d/loire-atlantique.py
cp $DIR_CHRONO/../secret /etc/chrono && chmod 755 /etc/chrono/secret

# NGINX CONFIG
cp $DIR_CHRONO/nginx-chrono.template /etc/nginx/conf.d/chrono.template

# USEFULL TO BE ABLE TO RUN THE MANAGER 
usermod chrono -s /bin/bash