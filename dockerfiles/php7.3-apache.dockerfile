FROM php:7.3-apache
COPY ./host_container/projetos/php7 /var/www/html/
LABEL AUTHOR="Breno Duarte <jbrenodm@gmail.com>"
VOLUME $PWD/host_container/projetos/php7