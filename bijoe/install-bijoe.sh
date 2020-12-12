

################
# bijoe
################

set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# INSTALL BIJOE
apt-get update \
    &&  apt-get install -y --no-install-recommends bijoe

# BIJOE CONFIG
mkdir -p /etc/bijoe/settings.d/
cp $DIR/bijoe.settings.py /etc/bijoe/settings.d/loire-atlantique.py
cp $DIR/../secret /etc/bijoe && chmod 755 /etc/bijoe/secret

# NGINX CONFIG
cp $DIR/nginx-bijoe.template /etc/nginx/conf.d/bijoe.template

# USEFULL TO BE ABLE TO RUN THE MANAGER 
usermod bijoe -s /bin/bash