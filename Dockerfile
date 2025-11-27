FROM php:8.2-apache

# Update OS packages
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    libzip-dev \
    unzip \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

WORKDIR /var/www/html

# Set file permission
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80
