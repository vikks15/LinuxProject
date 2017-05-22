#!/bin/bash

#echo "hello"

#root check
if [ "$EUID" != 0 ]
	then echo "I need to be root"
	exec sudo $0 root #replace this programm by
fi

#dir check
if [ $0 = "./LinuxProject/install.sh" ]; then
	cd LinuxProject
fi


useradd -m myuser
passwd -d myuser
su - myuser

echo "Starting to install"
echo "Install bc"
sudo apt install bc

echo "Install apache2"
sudo apt install -y sysstat apache2 libapache2-mod-php

echo "Stop apache2"
systemctl stop apache2

echo "Install nginx"
sudo apt install nginx

echo "Starting to copy files and scripts" 
sudo cp cronn /home/myuser/
sudo cp 000-default.conf /etc/apache2/sites-enabled/
sudo cp default /etc/nginx/sites-enabled/
sudo cp ports.conf /etc/apache2/

echo "Start apache2"
systemctl start apache2
 
sudo cp index.html /var/www/html/
sudo cp index.php /var/www/html/
sudo cp -R sysinfo /var/www/html/

sudo cp iostPeriodic.sh /home/myuser/
sudo cp cpuLoad.sh /home/myuser/
sudo cp iostat.sh /home/myuser/
sudo cp loadavg.sh /home/myuser/


#crontab -l -u myuser | cat /home/myuser/cronn | crontab -u myuser -


