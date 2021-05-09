#!/bin/bash

cd ../HammerDB-4.1
sudo bash mysql -h "localhost" -u "root" "-pmysql" DROP DATABASE tpcc;
#bash mysql DROP DATABASE tpcc;
echo "Construyendo esquema, espere por favor..."
bash hammerdbcli auto esquemaMySQL.tcl > log.txt
echo "Esquema construido"
echo "Empezando prueba"
bash hammerdbcli auto pruebaMySQL.tcl > ejecucion.txt
