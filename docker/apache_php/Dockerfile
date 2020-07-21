FROM ubuntu
# FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN sed --in-place --regexp-extended "s/(\/\/)(archive\.ubuntu)/\1cl.\2/" /etc/apt/sources.list && \
	apt-get update && apt-get upgrade --yes
RUN apt-get install tzdata -y
RUN echo "America/Santiago" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install vim -y --no-install-recommends
RUN apt-get install git -y --no-install-recommends
RUN apt-get install net-tools -y --no-install-recommends
RUN apt-get install iputils-ping -y --no-install-recommends
RUN apt-get install curl -y --no-install-recommends
RUN apt-get install unzip -y --no-install-recommends
RUN apt-get install sendmail -y --no-install-recommends
RUN apt-get install mailutils -y --no-install-recommends
RUN apt-get install mutt -y --no-install-recommends

#APACHE
RUN apt-get install apache2 -y --no-install-recommends
ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2 
RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR
RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

#PHP
RUN	apt-get update && apt-get upgrade --yes
RUN apt-get install libapache2-mod-php -y --no-install-recommends
RUN apt-get install php-mysql -y --no-install-recommends
RUN apt-get install php-mbstring -y --no-install-recommends
RUN apt-get install php-curl -y --no-install-recommends
RUN apt-get install composer -y --no-install-recommends
RUN apt-get install php-xml -y --no-install-recommends
RUN apt-get install php-cli -y --no-install-recommends
RUN apt-get install php-zip -y --no-install-recommends
# # COPY php.ini /usr/local/etc/php

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]