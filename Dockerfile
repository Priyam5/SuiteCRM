#getting base image PHP

FROM php:7.4-apache

MAINTAINER priyam singh <2020priyamsingh@gmail.com>

# Executed during the building of the image
RUN apt-get update
RUN apt-get install -y libzip-dev zip unzip zlib1g-dev
RUN docker-php-ext-install mysqli zip
 
# Executed when container created out of image
# ,"-D","FOREGROUND" 
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

# CMD echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

