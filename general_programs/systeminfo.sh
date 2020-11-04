#!/bin/bash

while true
do
	echo -e "\n1. Run command 'hostnamectl'"
	echo "2. Run command 'timedatectl'"
	echo "3. Run command 'uname -a'"
	echo "4. Run command 'sysctl -a'"
	echo "5. Exit"
	read -p "Enter your choiche: " ch

	case $ch in
		1 ) echo -e "\n`hostnamectl`"	;;
		2 ) echo -e "\n`timedatectl`"	;;
		3 ) echo -e "\n`uname -a`"	;;
		4 ) echo -e "\n`sysctl -a`"	;;
		5 ) exit 0			;;
		* ) echo -e "\nInvalid Input.."	;;
	esac
done

