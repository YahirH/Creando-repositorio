#!/bin/bash 

#Se ejecuta con una ip sacada del comando netstat -nr
#bash hola.sh 10.0.2.2 10 1000


#Ejemplo de scanner de puertos 

#Obtenido de pentestlab.wordpress.com 

#Parámetros 

host=$1 

firstport=$2 

lastport=$3 

#Funcion para escanear puertos 

function portscan { 

for ((counter=$firstport; counter<=$lastport; counter++)) 

do 

    (echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$counter open" 

done 

} 

#llamada de la funcion 

portscan 

if [ true ] ; then echo "Se ha Realizado con exito." ; fi;


