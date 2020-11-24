#!/bin/bash
arr=("w" "last" "uptime" "history" "tty")

for var in ${arr[*]}
do
	echo -e "\nCommand: $var\n"
	eval "$var"
	echo ""
	sleep 5
done
