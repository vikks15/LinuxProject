#!/bin/bash

LAVG1=`cut -f1 -d" " /proc/loadavg`
LAVG5=`cut -f2 -d" " /proc/loadavg`
LAVG15=`cut -f3 -d" " /proc/loadavg`

NCPU=$(lscpu | grep ^CPU\(s\) | awk '{print $2}') #cores of cpu
CRIT=$(echo "$NCPU*2" | bc -l)

pygmentize(){
	if [[ $(echo "$1 > $CRIT" | bc) -eq 1 ]]; then
		OUT="<span style='color: red;'>$1</span>" #position parameter $1
	elif [[ $(echo "$1 > $[NCPU]" | bc) -eq 1 ]]; then
		OUT="<span style='color: yellow;'>$1</span>"
	else
		OUT="<span style='color: green;'>$1</span>"
	fi
	echo $OUT
}


#echo "Content-Type: text/html"
echo "<html>"
#echo "<head><META HTTP-EQUIV='REFRESH' CONTENT='5'></head>"

echo "<h3>Load Average</h3>"

echo "<body><table border=1 width=100%>"
echo "<tr> <th>LA1</th> <th>LA5</th> <th>LA15</th></tr><tr>"

echo "<td>"
echo $CRIT
pygmentize $LAVG1 
echo "</td>"

echo "<td>"
pygmentize $LAVG5
echo "</td>"

echo "<td>"
pygmentize $LAVG15
echo "</td>"

echo "</table></body>"

