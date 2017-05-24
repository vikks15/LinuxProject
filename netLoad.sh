#!/bin/bash

cp /proc/net/dev /home/myuser/netrec 

echo "<html>"
echo "<head></head>"
echo "<body><table border=1 width=100%>"
echo "<tr> <th>IF</th> <th colspan="8">Receive</th> <th colspan="8">Transmit</th> </tr>"

echo "<h3>(/proc/net/dev)</h3>"

cat /home/myuser/netrec | tail -n +3 | while IFS=' ' read -r -a arr; do
	echo "<tr>"
		for i in {0..16}
		do
		echo "<th>${arr[$i]}</th>"
		done
	echo "</tr>"
	done
echo "</table></body></html>"
