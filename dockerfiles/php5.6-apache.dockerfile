FROM php:5.6-apache
COPY ./projetos/php5 /var/www/html/
LABEL AUTHOR="Breno Duarte <jbrenodm@gmail.com>"
VOLUME $PWD/projetos/php5