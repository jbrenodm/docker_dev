FROM mcr.microsoft.com/mssql/server:2019-CU3-ubuntu-18.04
LABEL AUTHOR="Breno Duarte <jbrenodm@gmail.com>"
VOLUME $PWD/host_container/databases/mssql