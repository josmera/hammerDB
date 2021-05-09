#!/bin/tclsh
puts "SETTING CONFIGURATION"
dbset db mysql
diset connection mysql_host 127.0.0.1
diset connection mysql_port 3306
diset connection mysql_socket /var/run/mysqld/mysqld.sock
diset tpcc mysql_count_ware 800
diset tpcc mysql_partition true
diset tpcc mysql_num_vu 64
diset tpcc mysql_storage_engine innodb
print dict
buildschema
