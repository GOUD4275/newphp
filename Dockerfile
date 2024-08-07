FROM php:7.1.23-apache
COPY ${WORKSPACE}/hello.php /usr/local/apache2/htdocs/
RUN docker-php-ext-install pdo_mysql
CMD ["apache2ctl", "-D", "FOREGROUND"]
