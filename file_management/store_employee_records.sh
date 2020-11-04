#!/bin/bash

addEmployee()
{
	echo ""
	read -p "Name: " ename
	read -p "Employee ID: " eid
	read -p "Address: " addr
	read -p "Mob No: " mob
	read -p "Joining Year: " join_year
	read -p "Current Salary: " salary

	# Store the details to a file
	echo "$ename $eid $addr $mob $join_year $salary" >> employees.txt
}

displayEmployee()
{
	echo ""
	read -p "Enter eid to display: " eid
	grep -w $eid employees.txt > temp

	if [ -s temp ]
	then
		echo -e "Employee Details..."
		details=`cat temp | awk -F " " '{print $1}'`
		echo "Name          : $details"
		details=`cat temp | awk -F " " '{print $2}'`
		echo "Employee ID   : $details"
		details=`cat temp | awk -F " " '{print $3}'`
		echo "Address       : $details"
		details=`cat temp | awk -F " " '{print $4}'`
		echo "Mob No        : $details"
		details=`cat temp | awk -F " " '{print $5}'`
		echo "Joining Year  : $details"
		details=`cat temp | awk -F " " '{print $6}'`
		echo "Current Salary: $details"
	else
		echo -e "\nEmployee with EID $eid doesn't exists..."
	fi

	rm temp
}

deleteEmployee()
{
	echo ""
	read -p "Enter eid to delete: " eid
	grep -v $eid employees.txt > temp
	cat temp > employees.txt

	rm temp
}

echo "Storing of details of Employees..."
while [ true ]
do
	echo -e "\n1. Add record of Employees"
	echo "2. Display record of Employees"
	echo "3. Delete record of Employees"
	echo "4. Exit"
	read -p "Enter a choiche: " ch

	case $ch in
		1 ) addEmployee ;;
		2 ) displayEmployee ;;
		3 ) deleteEmployee ;;
		4 ) exit 0 ;;
	esac
done
