#!/bin/bash

# Assuming marks in three subjects

getTotalPercentage()
{
	total=$(($1+$2+$3))
	echo "Total Marks: $total"
	per=$((100*total/300))
	echo "Percentage:  $per"
}

read -p "Enter number of students: " n

for((i = 1; i <= n; i++))
do
	echo ""
	echo "Enter marks in three subjects for Student $i ..."
	read m1
	read m2
	read m3
	echo ""
	echo "Student $i: "
	getTotalPercentage $m1 $m2 $m3
done

