#!/bin/bash

echo "hello"

#root check
if [ "$EUID" != 0 ]
	then echo "I need to be root"
	exec sudo $0 root #replace this programm by
fi

useradd -m myuser
passwd -d myuser

echo "Starting to install"
sudo apt install bc
sudo apt install -y sysstat apache2 libapache2-mod-php

systemctl stop apache2

sudo apt install nginx

echo "Starting to copy files and scripts" 
cp cronn /home/myuser/
cp 000-default.conf /etc/apache2/sites-enabled/
cp default /etc/nginx/sites-enabled/
cp ports.conf /etc/apache2/ 
cp index.html /var/www/html/
cp index.php /var/www/html/
cp -R sysinfo /var/www/html/

systemctl start apache2

su - myuser
crontab -l -u myuser | cat /home/myuser/cronn | crontab -u myuser -


