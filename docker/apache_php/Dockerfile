FROM ubuntu:latest

# Configuración de entorno
ENV DEBIAN_FRONTEND=noninteractive

# Actualización y configuración de la zona horaria
RUN sed -i -E "s/(\/\/)(archive\.ubuntu)/\1cl.\2/" /etc/apt/sources.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y tzdata && \
    echo "America/Santiago" > /etc/timezone && \
    ln -fs /usr/share/zoneinfo/America/Santiago /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Instalación de utilidades
RUN apt-get install -y --no-install-recommends \
    vim \
    git \
    net-tools \
    iputils-ping \
    curl \
    unzip \
    sendmail \
    mailutils \
    mutt

# Instalación y configuración de Apache
RUN apt-get install -y --no-install-recommends apache2 && \
    a2enmod rewrite && \
    mkdir -p /var/run/apache2 /var/lock/apache2 /var/log/apache2

# Variables de entorno para Apache
ENV APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2 \
    APACHE_PID_FILE=/var/run/apache2/apache2.pid \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_LOCK_DIR=/var/lock/apache2

# Instalación de PHP y extensiones
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libapache2-mod-php \
    php-mysql \
    php-mbstring \
    php-curl \
    composer \
    php-xml \
    php-cli \
    php-zip \
    php-gd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copiar archivos de configuración
COPY php.ini /usr/local/etc/php/
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Comando por defecto
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
