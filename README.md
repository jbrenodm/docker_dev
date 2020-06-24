# docker_dev
Ambiente de Desenvolvimento com Docker

Servicos disponiveis neste ambiente:
  * PHP-Apache 7.3 and Xdebug
  * PHP-Apache 5.6 and Xdebug
  * MySQL 5.7
  * MSSQL Server 2019 Developer Edition
  * Portainer


INSTRUCOES:

## PHP 7.3 APACHE ##
    * Criar IMAGEM 
        $ docker build -t jbrenodm/php-apache:7.3 -f $PWD/dockerfiles/php7.3-apache.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ sudo docker login 
        $ docker push jbrenodm/php-apache:7.3
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/php-apache:7.3    
    * Criar CONTAINER
        $ sudo docker run -d --name php7.3-apache8787 -p 8787:80 -v $PWD/host_container/projetos/php7:/var/www/html jbrenodm/php-apache:7.3
    * Instalar e Habilitar o Xdebug
        ** Dentro do container **
            * Instalar Extenções
                -docker-php-ext-install pdo pdo_mysql
                -docker-php-ext-install ldap
                - "reiniciar o container"
            * Instalar Xdebug            
              - pecl install xdebug
              - docker-php-ext-enable xdebug
              - "reiniciar o container"
              - echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - echo "xdebug.remote_connect_back=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - "reiniciar o container"

## PHP 5.6 APACHE ##
    * Criar IMAGEM 
        $ docker build -t jbrenodm/php-apache:5.6 -f $PWD/dockerfiles/php5.6-apache.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ sudo docker login 
        $ docker push jbrenodm/php-apache:5.6
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/php-apache:5.6
    * Criar CONTAINER
        $ sudo docker run -d --name php5.6-apache8585 -p 8585:80 -v $PWD/host_container/projetos/php5:/var/www/html jbrenodm/php-apache:5.6
    * Instalar e Habilitar o Xdebug
        ** Dentro do container **
            * Instalar Extenções
                -docker-php-ext-install pdo pdo_mysql
                -docker-php-ext-install ldap
                - "reiniciar o container"
            * Instalar Xdebug            
              - pecl install xdebug
              - docker-php-ext-enable xdebug
              - "reiniciar o container"
              - echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - echo "xdebug.remote_connect_back=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
              - "reiniciar o container"

## MySQL 5.7 ##
    * Criar IMAGEM 
        $ docker build -t jbrenodm/mysql:5.7 -f $PWD/dockerfiles/mysql5-7.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ sudo docker login 
        $ docker push jbrenodm/mysql:5.7
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/mysql:5.7
    * Criar CONTAINER
        $ sudo docker run -d --name mysql5.7 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes --network="host" -v $PWD/host_container/databases/mysql:/var/lib/mysql jbrenodm/mysql:5.7

## MSSQLSERVER 2019 Developer ##
    * Criar IMAGEM 
        docker build -t jbrenodm/mssql:2019dev -f $PWD/dockerfiles/mssql2019dev.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ sudo docker login 
        $ docker push jbrenodm/mssql:2019dev
    * Fazer Download da IMAGEM
        $ docker pull jbrenodm/mssql:2019dev
    * Criar CONTAINER
        $ sudo docker run -d --name mssql2019dev -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Senha123" --network="host" -v $PWD/host_container/databases/mssql:/host_container/databases/mssql jbrenodm/mssql:2019dev

## PORTAINER ##
    * Criar IMAGEM 
        sudo docker build -t jbrenodm/portainer:latest -f $PWD/dockerfiles/portainer.dockerfile .
    * Enviar IMAGEM para o DockerHub
        $ sudo docker login 
        $ docker push jbrenodm/portainer:latest
    * Criar CONTAINER
        $ sudo docker run -d -p 8000:8000 -p 9999:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data jbrenodm/portainer:latest

## NEXTCLOUD ##
    * Dentro do container
      * Instalar o "smbclient"
            apt update
            apt install libsmbclient-dev
            pecl install smbclient
            echo "extension=smbclient.so" > /usr/local/etc/php/conf.d/docker-php-ext-smbclient.ini
            Reiniciar o container





## ZABBIX APPLIANCE ##
    * Criar CONTAINER
        $ sudo docker run --name zabbix-appliance -p 8181:80 -p 10051:10051 -d zabbix/zabbix-appliance:ubuntu-latest