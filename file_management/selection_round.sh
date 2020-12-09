#!/bin/bash
add()
{
	echo ""
	echo "Enter candidate's details..."
	read -p "ID: " id
	read -p "Name: " name
	read -p "Post applied: " applied_post
	read -p "Written test mark: " written_mark
	read -p "Skill test mark: " skill_mark
	read -p "Viva Voce mark: " viva_mark
	read -p "Carrier Mark: " carrier_mark
	read -p "No of Papers Published: " papers
	read -p "Salary Expected(in Lakh): " salary

	# Calculate the average mark
	avg=`expr $written_mark + $skill_mark + $viva_mark + $carrier_mark`
	avg=`expr $avg / 4`
	echo $avg

	# Store the details to a file
	echo "$id,$sname,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> candidates.csv

	# Determine for phase 1
	if [ $avg -gt 90 ]
	then
		echo "$id,$sname,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase1.csv
	fi

	# Determine for phase 2
	if [ $avg -gt 5 ]
	then
		echo "$id,$sname,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase2.csv
	fi

	# Determine for phase 3
	if [ $avg -lt 10 ]
	then
		echo "$id,$sname,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase3.csv
	fi
}

displayAll()
{
	echo -e "\nRecords of all candidates...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average"
	cat candidates.csv
}

displayphase1()
{
	echo -e "\nRecords of all candidates selected for phase1 ...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average,Papers,Salary"
	cat phase1.csv
}

displayphase2()
{
	echo -e "\nRecords of all candidates selected for phase2 ...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average,Papers,Salary"
	cat phase2.csv
}

displayphase3()
{
	echo -e "\nRecords of all candidates selected for phase3 ...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average,Papers,Salary"
	cat phase3.csv
}

echo "Choose..."
while [ true ]
do
	echo -e "\n1. Add new Candidate"
	echo "2. Display Phase1 Selected Candidates Details"
	echo "3. Display Phase2 Selected Candidates Details"
	echo "4. Display Phase3 Selected Candidates Details"
	echo "5. Display records of Candidates Details"
	echo "6. Exit"
	read -p "Enter a choiche: " ch

	case $ch in
		1 ) add ;;
		2 ) displayphase1 ;;
		3 ) displayphase2 ;;
		4 ) displayphase3 ;;
		5 ) displayAll;;
		6 ) exit 0;;
		* ) echo -e "\n Invalid Choiche!!! Try Again...\n" ;;
	esac
done
