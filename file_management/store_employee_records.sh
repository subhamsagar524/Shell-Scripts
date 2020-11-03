#!/bin/bash

addEmployee()
{
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
	read -p "Enter eid to display: " eid
	awk '/${eid}/ {print}' employees.txt 
}

echo "Storing of details of Employees..."
while [ true ]
do
	echo "1. Add record of Employees"
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
