#!/bin/bash

#echo "hello"

dn=`dirname $0`
#root check
if [ "$EUID" != 0 ]
	then echo "I need to be root"
	exec sudo $0 root #replace this programm by
fi

#dir check
if [ $0 = "./install.sh" ]; then
	echo "nothing"
else cd $dn
fi


useradd -m myuser
passwd -d myuser

echo "Starting to install"
echo "Install bc"
sudo apt install bc

echo "Install apache2"
sudo apt install -y sysstat apache2 libapache2-mod-php

echo "Stop apache2"
systemctl stop apache2

echo "Install nginx"
sudo apt install -y nginx

echo "Stop nginx"
systemctl stop nginx

echo "Starting to copy files and scripts" 
cp 000-default.conf /etc/apache2/sites-enabled/
cp default /etc/nginx/sites-enabled/
cp ports.conf /etc/apache2/

echo "Start apache2 and nginx"
systemctl start apache2
systemctl start nginx
 
cp index.html /var/www/html/
cp index.php /var/www/html/
cp -R sysinfo /var/www/html/

cp iostPeriodic.sh /home/myuser/
cp cpuLoad.sh /home/myuser/
cp iostat.sh /home/myuser/
cp loadavg.sh /home/myuser/
cp df.sh /home/myuser/
cp inodes.sh /home/myuser/
cp ss.sh /home/myuser/

chown myuser /home/myuser/iostat.sh | chown myuser /home/myuser/loadavg.sh
chown myuser /home/myuser/cpuLoad.sh | chown myuser /home/myuser/df.sh

touch /home/myuser/iorec | touch /home/myuser/cpurec
touch /home/myuser/dfrec | touch /home/myuser/temp
chmod o+w /home/myuser/dfrec | chmod o+w /home/myuser/temp
chmod o+w /home/myuser/iorec | chmod o+w /home/myuser/cpurec

touch /home/myuser/inoderec | touch /home/myuser/itemp
chmod o+w /home/myuser/inoderec | chmod o+w /home/myuser/itemp

touch /home/myuser/ssrec
chmod o+w /home/myuser/ssrec
