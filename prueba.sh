#!/bin/bash

if [ $1 = 1 ]
then
echo "BORRANDO BASE DE DATOS PRUEBA ANTERIOR"
yes Y |  mysqladmin -h localhost -u root -pmysql drop tpcc >> /tmp/dbb>
fi
echo "INICIO CONSTRUCCION ESQUEMA"
date
echo "Construyendo esquema, espere por favor..."
#mkdir ../HammerDB_MySQL
bash hammerdbcli auto esquemaMySQL.tcl > log.txt
echo "Esquema construido"
echo "FIN CONSTRUCCION ESQUEMA"
date
echo "Empezando prueba"
echo "INICIO EJECUCION PRUEBA"
date
echo "Ejecutando prueba, espere por favor..."
bash hammerdbcli auto pruebaMySQL.tcl > ejecucion.txt
echo "FIN EJECUCION PRUEBA"
date
echo "Fin prueba, consulte los resultados en ../HammerDB_MySQL/ejecucion.txt"

