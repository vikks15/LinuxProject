#!/bin/bash

ss -ta | cut -d " " -f1 | sort -nr | uniq -c > /home/myuser/netkol
echo "<html>"
echo "<head></head>"
echo "<body><table border=1 width=100%>"
echo "<h3>Count</h3>"

cat /home/myuser/netkol | while IFS=' ' read -r -a arr; do
	echo "<tr>"
		for i in  0 1
		do
		echo "<th>${arr[$i]}</th>"
		done
	echo "</tr>"
	done
echo "</table></body></html>"
