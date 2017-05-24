#!/bin/bash

df > /home/myuser/dfrec
grep -v "/dev" /home/myuser/dfrec > /home/myuser/temp && cp /home/myuser/temp /home/myuser/dfrec
grep -v "/proc" /home/myuser/dfrec > /home/myuser/temp && cp /home/myuser/temp /home/myuser/dfrec
grep -v "/sys" /home/myuser/dfrec > /home/myuser/temp && cp /home/myuser/temp /home/myuser/dfrec
#echo $?

echo "<html>"
echo "<head></head>"
echo "<body><table border=1 width=100%>"
echo "<h3>File system disk space usage (df)</h3>"

cat /home/myuser/dfrec | while IFS=' ' read -r -a arr; do
	echo "<tr>"
		for i in  0 1 2 3 4 5
		do
		echo "<th>${arr[$i]}</th>"
		done
	echo "</tr>"
	done
echo "</table></body></html>"
