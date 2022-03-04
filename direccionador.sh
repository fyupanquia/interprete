#!/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH
for f in "./input"/*
do
        filename=$(basename $f)
        if [ "${f: -4}" == ".tar" ]
        then
                ./descomprimir.sh $filename
        else
                patron="LABORATORIO_02"
                if [[ "${filename:0:14}" == $patron ]]
                then
                        cp "./input/$filename" "./output/$filename"
                        ./auditoria.sh $filename SUCCESS
                else
                        cp  "./input/$filename" "./trash/$filename"
                        ./auditoria.sh $filename ERROR
                fi
        fi
done