#!/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH
time=(`date +%s`)
random=(`shuf -i 0-1000 -n 10`)
carpeta="$time-$random"
mkdir "./zip/${carpeta}"
tar -xzf "./input/$1" -C "./zip/${carpeta}"
for f in "./zip/${carpeta}"/*
do
        if [ "${f: -4}" == ".zip" ]
        then
                mkdir "./zip/${carpeta}/descomprimido"
                unzip $f -d "./zip/${carpeta}/descomprimido"
                for g in "./zip/${carpeta}/descomprimido"/*
                do
                        filename=$(basename $g)
                        if [ "${g: -4}" == ".zip" ]
                        then
                                cd "./zip/${carpeta}/descomprimido"
                                tar -zcf "../../../input/$filename.tar" "$filename"
                                cd "../../.."
                        else
                                mv $g "./input/$filename"
                        fi
                done
        else
                filename=$(basename $f)
                mv $f "./input/$filename"
        fi
        rm -r "./zip/${carpeta}"
        ./auditoria.sh $1 MIDDLE
done