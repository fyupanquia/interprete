#!/bin/bash
cd /home
sudo mkdir interprete
cd interprete
sudo apt-get update
sudo apt-get install zip gzip tar cron
sudo apt-get install -y systemd
sudo apt-get install -y ftp
sudo mkdir auditoria
sudo mkdir input
sudo mkdir output
sudo mkdir trash
sudo mkdir zip
sudo touch auditoria/data.csv
sudo chmod +x auditoria.sh
sudo chmod +x direccionador.sh
sudo chmod +x descomprimir.sh
sudo chmod +x emisor.sh
sudo systemctl enable cron
echo "* * * * * /home/interprete/direccionador.sh" >> /etc/crontab
echo "* * * * * /home/interprete/emisor.sh" >> /etc/crontab