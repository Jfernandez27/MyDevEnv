#!/bin/bash
set -e

# Crea la extensión PostGIS en la base de datos principal
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS postgis;
    CREATE EXTENSION IF NOT EXISTS postgis_topology;
EOSQL
