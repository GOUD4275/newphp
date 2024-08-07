FROM httpd
COPY ${WORKSPACE}/hello.php /usr/local/apache2/htdocs/
CMD ["apache2ctl", "-D", "FOREGROUND"]
