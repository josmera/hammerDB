#!/bin/bash


int main(int argc, char* argv[]) { 

	if (argc != 2) {
		printf("Por favor ingrese: \n1->Prueba inicial.\n0->No prueba inicial.",argv[0]);
		return 1;
	}
	
	if (argc == 0) {
		
		bash mysql DROP DATABASE tpcc;
		cd ../HammerDB-4.1
		echo "Construyendo esquema, espere por favor..."
		bash hammerdbcli auto esquemaMySQL.tcl
		echo "Esquema construido"
		echo "Empezando prueba"
		bash hammerdbcli auto pruebaMySQL.tcl > ejecucion.txt
		return 0;
	}	
	
	if (argc == 1) {
		cd ../HammerDB-4.1
		echo "Construyendo esquema, espere por favor..."
		bash hammerdbcli auto esquemaMySQL.tcl
		echo "Esquema construido"
		echo "Empezando prueba"
		bash hammerdbcli auto pruebaMySQL.tcl > ejecucion.txt
		return 0;
	}

}

