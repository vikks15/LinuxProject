#!/bin/bash

iostat -c 1 2 > /home/myuser/cpurec
#iostat -c 1 2

#RowLine=`wc -l /home/myuser/cpurec`
echo "<html>"
#echo "<head></head>"

echo "<body><table border=1 width=100%>"
echo "<tr> <th>avg-cpu:</th> <th>%user+%nice</th> <th>%system</th> <th>%iowait</th> <th>%idle</th> </tr>"
echo "<h3>CPU load (iostat -c)</h3>"
echo "<tr>"

cat /home/myuser/cpurec | tail -n 4 | tail -n +3 | head -n 1 | while IFS=' ' read -r -a arr; do
	echo "<th></th>"
	echo "<th>" 
	echo  ${arr[0]}+${arr[1]} | bc
	echo  "</th>"
	echo " <th> ${arr[2]} </th> <th>${arr[3]}</th> <th>${arr[5]}</th>"
	done

echo "</tr></table></body></html>"
