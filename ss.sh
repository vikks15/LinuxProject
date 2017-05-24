#!/bin/bash

ss -tua > /home/myuser/ssrec

echo "<html>"
echo "<head></head>"
echo "<body><table border=1 width=100%>"
echo "<h3>Network connections (ss -tua)</h3>"

cat /home/myuser/ssrec | while IFS=' ' read -r -a arr; do
	echo "<tr>"
		for i in  0 1 2 3 4 5
		do
		echo "<th>${arr[$i]}</th>"
		done
	echo "</tr>"
	done
echo "</table></body></html>"
