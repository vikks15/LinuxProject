#!/bin/bash

while true
do
	iostat -d | head -7 | tail -5 > iorec
	sleep 5
done


#iostat -d | head -7 | tail -4 > iorec
