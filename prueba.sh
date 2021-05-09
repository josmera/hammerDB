#!/bin/bash

cd ../HammerDB-4.1
sudo bash mysql -h "localhost" -u "root" "-pmysql" DROP DATABASE tpcc;
#bash mysql DROP DATABASE tpcc;
#echo "Construyendo esquema, espere por favor..."
#mkdir ../HammerDB_MySQL
#bash hammerdbcli auto esquemaMySQL.tcl > ../HammerDB_MySQL/log.txt
#echo "Esquema construido"
echo "Empezando prueba"
bash hammerdbcli auto pruebaMySQL.tcl > ../HammerDB_MySQL/ejecucion.txt
echo "Fin prueba, consulte los resultados en ../HammerDB_MySQL/ejecucion.txt"
