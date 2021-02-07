#!/bin/bash
set -e
DIR_INIT_DB="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR_INIT_DB/configure.env
$DIR_INIT_DB/base/check-env.sh

# Create all databases except WCS one which is created when first started
psql -v ON_ERROR_STOP=1 <<-EOSQL
    CREATE USER ${DB_HOBO_USER};
    CREATE DATABASE ${DB_HOBO_NAME} TEMPLATE=template0 ENCODING 'UTF8' LC_COLLATE='fr_FR.UTF-8' LC_CTYPE='fr_FR.UTF-8';
    GRANT ALL PRIVILEGES ON DATABASE ${DB_HOBO_NAME} TO ${DB_HOBO_USER};
    ALTER USER ${DB_HOBO_USER} WITH PASSWORD '${DB_HOBO_PASS}';
    CREATE USER ${DB_PASSERELLE_USER};
    CREATE DATABASE ${DB_PASSERELLE_NAME} TEMPLATE=template0 LC_COLLATE='fr_FR.UTF-8' LC_CTYPE='fr_FR.UTF-8';
    GRANT ALL PRIVILEGES ON DATABASE ${DB_PASSERELLE_NAME} TO ${DB_PASSERELLE_USER};
    ALTER USER ${DB_PASSERELLE_USER} WITH PASSWORD '${DB_PASSERELLE_PASS}';
    CREATE USER ${DB_COMBO_USER};
    CREATE DATABASE ${DB_COMBO_NAME} TEMPLATE=template0 LC_COLLATE='fr_FR.UTF-8' LC_CTYPE='fr_FR.UTF-8';
    GRANT ALL PRIVILEGES ON DATABASE ${DB_COMBO_NAME} TO ${DB_COMBO_USER};
    ALTER USER ${DB_COMBO_USER} WITH PASSWORD '${DB_COMBO_PASS}';
    CREATE USER ${DB_FARGO_USER};
    CREATE DATABASE ${DB_FARGO_NAME} TEMPLATE=template0 LC_COLLATE='fr_FR.UTF-8' LC_CTYPE='fr_FR.UTF-8';
    GRANT ALL PRIVILEGES ON DATABASE ${DB_FARGO_NAME} TO ${DB_FARGO_USER};
    ALTER USER ${DB_FARGO_USER} WITH PASSWORD '${DB_FARGO_PASS}';
    CREATE USER ${DB_WCS_USER} CREATEDB;
    ALTER USER ${DB_WCS_USER} WITH PASSWORD '${DB_WCS_PASS}';
    CREATE USER ${DB_AUTHENTIC_USER};
    CREATE DATABASE ${DB_AUTHENTIC_NAME} TEMPLATE=template0 LC_COLLATE='fr_FR.UTF-8' LC_CTYPE='fr_FR.UTF-8';
    GRANT ALL PRIVILEGES ON DATABASE ${DB_AUTHENTIC_NAME} TO ${DB_AUTHENTIC_USER};
    ALTER USER ${DB_AUTHENTIC_USER} WITH PASSWORD '${DB_AUTHENTIC_PASS}';
    CREATE USER ${DB_CHRONO_USER};
    CREATE DATABASE ${DB_CHRONO_NAME} TEMPLATE=template0 LC_COLLATE='fr_FR.UTF-8' LC_CTYPE='fr_FR.UTF-8';
    GRANT ALL PRIVILEGES ON DATABASE ${DB_CHRONO_NAME} TO ${DB_CHRONO_USER};
    ALTER USER ${DB_CHRONO_USER} WITH PASSWORD '${DB_CHRONO_PASS}';
    CREATE USER ${DB_BIJOE_USER};
    CREATE DATABASE ${DB_BIJOE_NAME} TEMPLATE=template0 LC_COLLATE='fr_FR.UTF-8' LC_CTYPE='fr_FR.UTF-8';
    GRANT ALL PRIVILEGES ON DATABASE ${DB_BIJOE_NAME} TO ${DB_BIJOE_USER};
    ALTER USER ${DB_BIJOE_USER} WITH PASSWORD '${DB_BIJOE_PASS}';
EOSQL