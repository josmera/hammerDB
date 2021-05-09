#!/bin/bash

cd ../HammerDB-4.1
bash mysql -h "localhost" -u "root" "-pmysql" DROP DATABASE tpcc;
#bash mysql DROP DATABASE tpcc;
#echo "Construyendo esquema, espere por favor..."
#mkdir ../HammerDB_MySQL
bash hammerdbcli source esquemaMySQL.tcl > log.txt
echo "Esquema construido"
echo "Empezando prueba"
bash hammerdbcli source pruebaMySQL.tcl > ejecucion.txt
echo "Fin prueba, consulte los resultados en ../HammerDB_MySQL/ejecucion.txt"
