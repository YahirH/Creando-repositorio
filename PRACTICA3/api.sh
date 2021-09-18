#!/usr/bin/env bash 


echo Script para peticiones a API


API_KEY=$1
API_PSS=$2
GIT_USR=YahirH

#primera
curl -s "https://api.github.com/users/$GIT_USR/repos"
echo " "
echo se realizo con exito

#segunda
curl -s https://api.github.com/repos/YahirH/repositorios-WYHR/contents/
echo se realizo con exito


#tercera
curl -s https://api.github.com/repos/YahirH/repositorios-WYHR/languages
echo se realizo con exito


#cuarta

curl -s https://api.github.com/repos/YahirH/repositorios-WYHR/collaborators
echo se realizo con exito

#quinta
curl -s https://api.github.com/repos/YahirH/repositorios-WYHR/git/tags
echo Terminan los requests a la API


