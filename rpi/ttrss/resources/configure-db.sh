#!/bin/bash

PGVERSION=`pg_lsclusters -h | awk '{ print $1 }'`

echo "local  all  postgres           peer" > /etc/postgresql/$PGVERSION/main/pg_hba.conf
echo "local  all  all                md5" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf
echo "host   all  all       ::1/128  md5" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf

service postgresql restart

su postgres -c psql << EOF
CREATE USER fox WITH PASSWORD 'XXXXXX';
CREATE DATABASE fox WITH OWNER fox;
EOF

env PGPASSWORD=XXXXXX psql -U fox -d fox < /var/www/ttrss/schema/ttrss_schema_pgsql.sql

