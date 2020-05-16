FROM php:7.3-apache
COPY ./projetos/php7 /var/www/html/
LABEL AUTHOR="Breno Duarte <jbrenodm@gmail.com>"
VOLUME $PWD/projetos/php7