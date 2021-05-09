#!/bin/bash

#Actualizar el sistema operativo
sudo apt-get update

#Instalar MySQL
sudo apt install -y mysql-server

#Configuración interactiva de MySQL
[ ! -e /usr/bin/expect ] && apt-get update && apt-get -y install expect

#// Not required in actual script
MYSQL_ROOT_PASSWORD=mysql

SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"

#Desinstalar el programa para realizar la configuración interactiva
sudo apt-get -y purge expect

#Modificar el script de configuración de MySQL
sudo bash -c 'echo -e "[mysqld]\nskip-grant-tables" >> /etc/mysql/my.cnf'

sudo bash -c 'echo -e "[client]\nuser = root\npassword = mysql" >> /etc/mysql/my.cnf'

#Parar el servicio MySQL para que tome la nueva configuración
sudo service mysql stop

#Inicar el servicio MySQL para que arranque con la nueva configuración
sudo service mysql start

#Instalación de paquete para descarga instalador HammerDB
sudo apt-get install -y curl

#Instalación librerias adicionales HammerDB
sudo  apt-get install -y libxft2 libxft2:amd64 lib32ncurses5

sudo apt-get install -y libxft2

sudo apt-get install -y libxft2:amd64

#Descarga del instalador HammerDB desde el repositorio GitHub oficial
wget --no-check-certificate --content-disposition https://github.com/TPC-Council/HammerDB/releases/download/v4.1/HammerDB-4.1-Linux.tar.gz

#Descompresión de archivo instalador HammerDB
tar -zxvf HammerDB-4.1-Linux.tar.gz

#Instalación paquete adicional para métricas de CPU
sudo apt install sysstat -y

#Habilitación paquete adicional métricas
sudo bash -c 'echo "ENABLED="true"" >> /etc/default/sysstat'

#Inicio servicio métricas
sudo systemctl enable sysstat

sudo systemctl start sysstat


