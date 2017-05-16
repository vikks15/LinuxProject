#!/bin/bash

echo "hello"

if [ "$EUID" != 0 ]
	then echo "I need to be root"
	exec sudo $0 root #replace this programm by
fi

useradd -m myuser
passwd -d myuser
cp cronn /home/myuser/ 
su - myuser

crontab -l -u myuser | cat /home/myuser/cronn | crontab -u myuser -

#crontab -e * * * * * top -b -n 1|wall
#crontab u1 -l > cr
#* * * * * top -b -n 1 | wall >> cr
#crontab u1 cr 
#rm cr
#sudo apt install -y sysstat apache2 libapache2-mod-php
#apache2 stop
#sudo apt install nginx

