#!/bin/bash

# Verifica si Docker está instalado y en funcionamiento
if ! command -v docker &> /dev/null; then
    echo "Docker no está instalado o no está en el PATH."
    exit 1
fi

# Obtiene la lista de todos los contenedores (tanto en ejecución como detenidos)
CONTAINER_IDS=$(docker ps -aq)

if [ -z "$CONTAINER_IDS" ]; then
    echo "No hay contenedores para inspeccionar."
    exit 0
fi

# Inspecciona cada contenedor
for CONTAINER_ID in $CONTAINER_IDS; do
    echo "Inspeccionando contenedor $CONTAINER_ID"
    docker inspect "$CONTAINER_ID"
    echo "------------------------------------------------------------"
done
