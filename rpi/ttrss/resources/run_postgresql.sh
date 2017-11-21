#!/bin/sh

# This script is run by Supervisor to start PostgreSQL 9.1 in foreground mode

if [ -d /var/run/postgresql ]; then
    chmod 2775 /var/run/postgresql
else
    install -d -m 2775 -o postgres -g postgres /var/run/postgresql
fi

PGVERSION=`pg_lsclusters -h | awk '{ print $1 }'`

exec su postgres -c "/usr/lib/postgresql/$PGVERSION/bin/postgres -D /var/lib/postgresql/$PGVERSION/main -c config_file=/etc/postgresql/$PGVERSION/main/postgresql.conf"
