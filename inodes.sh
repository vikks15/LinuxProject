#!/bin/bash

df -i > /home/myuser/inoderec
grep -v "/dev" /home/myuser/inoderec > /home/myuser/itemp && cp /home/myuser/itemp /home/myuser/inoderec
grep -v "/proc" /home/myuser/inoderec > /home/myuser/itemp && cp /home/myuser/itemp /home/myuser/inoderec
grep -v "/sys" /home/myuser/inoderec > /home/myuser/itemp && cp /home/myuser/itemp /home/myuser/inoderec

echo "<html>"
echo "<head></head>"
echo "<body><table border=1 width=100%>"

echo "<h3>inodes</h3>"

cat /home/myuser/inoderec | while IFS=' ' read -r -a arr; do
	echo "<tr>"
		for i in  0 1 2 3 4 5
		do
		echo "<th>${arr[$i]}</th>"
		done
	echo "</tr>"
	done
echo "</table></body></html>"
