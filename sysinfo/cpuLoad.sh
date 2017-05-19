#!/bin/bash
#iostat -c | tail -2 | head -1 > cpurec

#iostat -c
#cat cpurec

echo "<html>"
echo "<head></head>"

echo "<body><table border=1 width=100%>"
echo "<tr> <th>avg-cpu:</th> <th>%user+%nice</th> <th>%system</th> <th>%iowait</th> <th>%idle</th> </tr>"

#iostat -d | head -7 | tail -5 > iorec
echo "<h3>iostat -c</h3>"

echo "<tr>"

cat cpurec | while IFS=' ' read -r -a arr; do
	echo "<th></th>"
	echo "<th>" 
	echo  ${arr[0]}+${arr[2]} | bc
	echo  "</th>"
	echo " <th> ${arr[2]} </th> <th>${arr[3]}</th> <th>${arr[5]}</th>"
	done

echo "</tr>"


echo "</body>"
echo "</html>"
