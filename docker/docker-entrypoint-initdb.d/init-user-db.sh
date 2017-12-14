#!/bin/bash

set -eu

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE dvdrental;
    GRANT ALL PRIVILEGES ON DATABASE dvdrental TO postgres;
EOSQL

pg_restore -U postgres -d dvdrental /tmp/dvdrental.tar
