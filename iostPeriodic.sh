#!/bin/bash

while true
do
#	iostat -d 1 2 | head -7 | tail -5 > iorec
	iostat -d 1 2 > iorec
	iostat -c 1 2 > cpurec
	sleep 10
done


#iostat -d | head -7 | tail -4 > iorec
