FROM php:5.6-apache
COPY ./host_container/projetos/php5 /var/www/html/
LABEL AUTHOR="Breno Duarte <jbrenodm@gmail.com>"
VOLUME $PWD/host_container/projetos/php5