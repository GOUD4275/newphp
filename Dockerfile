FROM php:7.1.23-apache
COPY ${WORKSPACE}/hello.php /usr/local/apache2/htdocs/
CMD ["apache2ctl", "-D", "FOREGROUND"]
