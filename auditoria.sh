#!/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH
random=(`shuf -i 0-1000 -n 10`)
time=(`date +%s`)
carpeta="$time-$random"
mkdir "./auditoria/$carpeta"
mv "./input/$1" "./auditoria/$carpeta/$1"
echo "$2,$carpeta,./auditoria/$carpeta/$1" | cat - "./auditoria/data.csv" > temp && mv temp "./auditoria/data.csv"