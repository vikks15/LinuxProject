#!/bin/bash

#echo "hello"

#dir check
if [ $0 = "./LinuxProject/install.sh" ]; then
	cd LinuxProject
fi


#root check
if [ "$EUID" != 0 ]
	then echo "I need to be root"
	exec sudo $0 root #replace this programm by
fi

useradd -m myuser
passwd -d myuser
su -myuser

echo "Starting to install"
sudo apt install bc
sudo apt install -y sysstat apache2 libapache2-mod-php

systemctl stop apache2

sudo apt install nginx

echo "Starting to copy files and scripts" 
sudo cp cronn /home/myuser/
sudo cp 000-default.conf /etc/apache2/sites-enabled/
sudo cp default /etc/nginx/sites-enabled/
sudo cp ports.conf /etc/apache2/ 
sudo cp index.html /var/www/html/
sudo cp index.php /var/www/html/
sudo cp -R sysinfo /var/www/html/

systemctl start apache2

#crontab -l -u myuser | cat /home/myuser/cronn | crontab -u myuser -


