#!/bin/bash

# Function to get the grades
getGrades()
{
	res=()
	read -a grades
	for i in ${grades[*]}
	do
		if [ "$i" = "O" ] || [ "$i" = "o" ]
		then
			res+=(10)
		elif [ "$i" = "A" ] || [ "$i" = "a" ]
		then
			res+=(9)
		elif [ "$i" = "B" ] || [ "$i" = "b" ]
		then
			res+=(8)
		elif [ "$i" = "C" ] || [ "$i" = "c" ]
		then
			res+=(7)
		elif [ "$i" = "D" ] || [ "$i" = "d" ]
		then
			res+=(6)
		else
			echo -e "\n\n You Failed!!!"
			exit 0
		fi
	done
}

# Driver
# Get the total number of semester
echo -e "\nEnter total Semesters: "
read sem

# SGPA for all semesters
sgpas=()

for((k = 0; k < $sem; k++))
do
	# Processes for each semester
	echo -e "\n\nSemester `expr $k + 1`..."
	# Get subject credits
	echo "Enter subject credits: "
	read -a credits

	# Get the grade points from grades
	echo "Enter grades: "
	getGrades
	grade_points=(${res[*]})

	# Calculate SGPA
	len=${#credits[*]}

	total_credits=0
	for var in ${credits[*]}
	do
		total_credits=`expr $total_credits + $var`
	done

	sgpa=0
	for ((i = 0; i < $len; i++))
	do
		temp=`echo "${credits[$i]} * ${grade_points[$i]}" | bc -l`
		sgpa=`echo "$temp + $sgpa" | bc -l`
	done

	sgpa=`echo "scale=2; $sgpa / $total_credits" | bc -l`
	sgpas+=($sgpa)

	echo "SGPA for Semester `expr $k + 1`: $sgpa"

done

# Calculating the total SGPA
total_sgpa=0

for l in ${sgpas[*]}
do
	total_sgpa=`echo "scale=2; $total_sgpa + $l" | bc -l`
done

# Calculating CGPA
cgpa=`echo "scale=2; $total_sgpa / ${#sgpas[*]}" | bc -l`
echo -e "\nTotal CGPA: $cgpa"
