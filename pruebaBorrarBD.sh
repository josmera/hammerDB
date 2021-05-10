#!/bin/bash

if [ $1 = 1 ]
then
yes Y |  mysqladmin -h localhost -u root -pmysql drop tpcc >> /tmp/dbborrada.txt
fi
date

