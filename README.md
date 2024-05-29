# Desarrollo de Entorno con Docker y Docker Compose

Este repositorio contiene todo lo necesario para configurar y levantar un ambiente de desarrollo utilizando Docker y Docker Compose.

## Contenido

- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Uso](#uso)
  - [Levantar los Servicios](#levantar-los-servicios)
  - [Detener los Servicios](#detener-los-servicios)
  - [Acceder a los Contenedores](#acceder-a-los-contenedores)
  - [Ver Logs](#ver-logs)
- [Scripts Útiles](#scripts-útiles)
- [Problemas Comunes](#problemas-comunes)
- [Contribuir](#contribuir)

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalados los siguientes programas en tu sistema:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/)

## Instalación

1. Clona este repositorio en tu máquina local:

   ```sh
   git clone https://github.com/Jfernandez27/MyDevEnv.git
   cd MyDevEnv

<!-- 2. Copia el archivo de ejemplo .env.example a .env y modifica los valores según tus necesidades:

    ```sh
    cp .env.example .env -->

## Estructura del Proyecto

La estructura del proyecto es la siguiente:

    ├── docker/
    │   ├── docker-compose.yml
    │   ├── apache_php/
    │   ├── mariadb/
    │   └── mysql/
    ├── env/
    └── scripts/
        ├── linux
            ├── build.sh
            ├── inspectAllContainers.sh
            ├── up.sh
            ├── bdUp.sh
            ├── down.sh
            └── pullAll.sh
    ├── www/
    ├── README.md

## Uso

### Levantar los Servicios

Para levantar los servicios definidos en `docker-compose.yml`, ejecuta:

```sh
docker-compose up -d 
```

Esto iniciará los contenedores en segundo plano.

### Detener los Servicios

Para detener los servicios, ejecuta:
```sh
docker-compose down
```

### Acceder a los Contenedores
Para acceder a un contenedor en ejecución, utiliza:
```sh
docker exec -it <nombre_del_contenedor> /bin/bash
```
Reemplaza <nombre_del_contenedor> con el nombre o ID del contenedor al que deseas acceder.

### Ver Logs
Para ver los logs de los contenedores, ejecuta:
```sh
docker-compose logs -f
```

## Scripts Útiles

Este repositorio incluye varios scripts útiles:

- `bdUp.sh`: Levanta solo los contenedores de bases de datos.
- `up.sh`: Levanta todos los contenedores.
- `down.sh`: Baja todos los contenedores.
- `build.sh`: Construye los contenedores.
- `pullAll.sh`: Ejecuta `git pull` en cada uno de los proyectos que estemos trabajando.
- `inspectAllContainers.sh`: Inspecciona todos los contenedores en el sistema.



### Cómo Ejecutar los Scripts
1. Asegúrate de que los scripts tienen permisos de ejecución:
    ```sh
    chmod +x scripts/linux/*.sh

2. Ejecuta el script que necesites:
    ```sh
    ./scripts/linux/nombre_del_script.sh

## Problemas Comunes
### Docker No Está Corriendo
Si obtienes un error indicando que Docker no está corriendo, asegúrate de que Docker Desktop está iniciado y corriendo en tu sistema.

# Permisos Denegados
Si obtienes un error de permisos denegados, intenta ejecutar los comandos con sudo:
```sh
sudo docker-compose up -d
```
## Contribuir

Si deseas contribuir a este proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama con tu característica (`git checkout -b feature/nueva-caracteristica`).
3. Realiza tus cambios y haz commit (`git commit -am 'Añadir nueva característica'`).
4. Envía tu rama (`git push origin feature/nueva-caracteristica`).
5. Abre un Pull Request.

¡Gracias por contribuir!

## Licencia

Este proyecto está licenciado bajo la [Licencia MIT](LICENSE). 

