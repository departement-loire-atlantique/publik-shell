################
# base
################

set -eu
DIR_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# COMMON TOOLS AND APT SOURCES
apt update
apt install -y vim gettext wget nginx-full quilt gnupg git zip

# APT SOURCES
echo 'deb http://deb.debian.org/debian/ buster-backports main' > /etc/apt/sources.list.d/backports.list
echo 'deb http://deb.entrouvert.org/ buster main' > /etc/apt/sources.list.d/entrouvert.list
wget -q -O- https://deb.entrouvert.org/entrouvert.gpg | apt-key add -

# configurations particulières de apt pour EO
apt update
apt install -y -o Dpkg::Options::="--force-confnew" entrouvert-repository entrouvert-archive-keyring
apt install entrouvert-repository-hotfix

cp $DIR_BASE/global.nginx.conf /etc/nginx/conf.d/global.conf

# set env vars and create pyenv
source $DIR_BASE/../configure.env
$DIR_BASE/check-env.sh
# pyenv Needs to be in a directory that can be read by a non-root user, so not "/root"
envsubst '$DB_HOBO_NAME $DB_PASSERELLE_NAME $DB_COMBO_NAME $DB_FARGO_NAME $DB_WCS_NAME $DB_AUTHENTIC_NAME $DB_CHRONO_NAME $DB_BIJOE_NAME $DB_HOBO_USER $DB_PASSERELLE_USER $DB_COMBO_USER $DB_FARGO_USER $DB_WCS_USER $DB_AUTHENTIC_USER $DB_CHRONO_USER $DB_BIJOE_USER $APPNAME $DEBUG $LOG_LEVEL $LOG_CHANNEL $ALLOWED_HOSTS $DB_PORT $DB_HOBO_PASS $DB_PASSERELLE_PASS $DB_COMBO_PASS $DB_FARGO_PASS $DB_WCS_PASS $DB_AUTHENTIC_PASS $DB_CHRONO_PASS $DB_BIJOE_PASS $RABBITMQ_DEFAULT_USER $RABBITMQ_DEFAULT_PASS $RABBITMQ_PORT $ERROR_MAIL_AUTHOR $ERROR_MAIL_ADDR $SMTP_HOST $SMTP_USER $SMTP_PASS $SMTP_PORT' < $DIR_BASE/pyenv.template > /home/pyenv.py
chmod 755 /home/pyenv.py

# TIMEZONE
rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && echo "Europe/Paris" > /etc/timezone && \
    apt update \
    && apt install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && dpkg-reconfigure -f noninteractive tzdata && \
    sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="fr_FR.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8