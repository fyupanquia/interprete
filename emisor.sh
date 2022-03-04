#!/bin/bash
username="LABORATORIO_02"
password="PASSWORD"
hostname="mediador.com"
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH
for f in "./output"/*
do
    ftp -n <<EOF
    open $hostname
    user $username $password
    put $f
    EOF
done