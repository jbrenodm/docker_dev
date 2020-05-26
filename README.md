# docker_dev
Ambiente de Desenvolvimento com Docker

Servicos disponiveis neste ambiente:
  * PHP-Apache 7.3
  * PHP-Apache 5.6
  * MySQL 5.7
  * MSSQL Server 2019 Developer Edition


INSTRUCOES:

## PHP 7.3 APACHE ##
    * Criar IMAGEM 
        $ docker build -t jbrenodm/php-apache:7.3 -f $PWD/dockerfiles/php7.3-apache.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ docker login 
        $ docker push jbrenodm/php-apache:7.3
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/php-apache:7.3    
    * Criar CONTAINER
        $ docker run -d --name php7.3-apache8787 -p 8787:80 -v $PWD/host_container/projetos/php7:/var/www/html jbrenodm/php-apache:7.3

## PHP 5.6 APACHE ##
    * Criar IMAGEM 
        $ docker build -t jbrenodm/php-apache:5.6 -f $PWD/dockerfiles/php5.6-apache.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ docker login 
        $ docker push jbrenodm/php-apache:5.6
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/php-apache:5.6
    * Criar CONTAINER
        $ docker run -d --name php5.6-apache8585 -p 8585:80 -v $PWD/host_container/projetos/php5:/var/www/html jbrenodm/php-apache:5.6

## MySQL 5.7 ##
    * Criar IMAGEM 
        $ docker build -t jbrenodm/mysql:5.7 -f $PWD/dockerfiles/mysql5-7.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ docker login 
        $ docker push jbrenodm/mysql:5.7
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/mysql:5.7
    * Criar CONTAINER
        $ docker run -d --name mysql5.7 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes --network="host" -v $PWD/host_container/databases/mysql:/var/lib/mysql jbrenodm/mysql:5.7

## MSQ SQLSERVER 2019 Developer ##
    * Criar IMAGEM 
        docker build -t jbrenodm/mssql:2019dev -f $PWD/dockerfiles/mssql2019dev.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ docker login 
        $ docker push jbrenodm/mssql:2019dev
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/mssql:2019dev
    * Criar CONTAINER
        $ docker run -d --name mssql2019dev -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Senha123" --network="host" -v $PWD/host_container/databases/mssql:/host_container/databases/mssql jbrenodm/mssql:2019dev