# Usa la imagen oficial de PostgreSQL como base
FROM postgres:latest

# Instala PostGIS
RUN apt-get update && apt-get install -y postgis postgresql-13-postgis-3

# Copia archivos de inicialización SQL (opcional)
COPY initdb-postgis.sh /docker-entrypoint-initdb.d/
