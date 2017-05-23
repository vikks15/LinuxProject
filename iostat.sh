#!/bin/bash

iostat -d 1 2 > /home/myuser/iorec
iostat -d 1 2

RowNum=`wc -l /home/myuser/iorec | cut -d" " -f1`


echo "<html>"
echo "<head></head>"

echo "<body><table border=1 width=100%>"
echo "<tr> <th>Devices:</th> <th>tps</th> <th>kB_read/s</th> <th>kB_wrtn/s</th> <th>kB_read</th> <th>kB_wrtn</th> </tr>"

#iostat -d
#./iostPeriodic.sh
echo "<h3>iostat -d</h3>"

cat /home/myuser/iorec | tail -n `expr $RowNum / 2` | tail -n +3 | head -n 3 | while IFS=' ' read -r -a arr; do
	echo "<tr>"
		for i in  0 1 2 3 4 5
		do
		echo "<th>${arr[$i]}</th>"
		done
	echo "</tr>"
	done

echo "</body>"
echo "</html>"
