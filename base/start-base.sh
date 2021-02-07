set -eu
DIR_START_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR_START_BASE/../configure.env

# restart rabbitmq-server
service rabbitmq-server restart

# check the database and rabbitmq

$DIR_START_BASE/wait-for-it.sh -t 60 db:${DB_PORT}
$DIR_START_BASE/wait-for-it.sh -t 60 rabbitmq:${RABBITMQ_PORT}
