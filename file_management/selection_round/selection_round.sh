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

	# Store the details to a file
	echo "$id,$name,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> candidates.csv

	# Determine for phase 1
	if [ $avg -gt 90 ]
	then
		echo "$id,$name,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase1.csv
	fi

	# Determine for phase 2
	if [ $papers -gt 5 ]
	then
		echo "$id,$name,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase2.csv
	fi

	# Determine for phase 3
	if [ $salary -lt 10 ]
	then
		echo "$id,$name,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase3.csv
	fi
}

displayAll()
{
	echo -e "\nRecords of all candidates...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average"
	if [ -s candidates.csv ]
	then
		cat candidates.csv
	else
		echo -e "No candidates records available try adding some records first."
	fi
}

displayphase1()
{
	echo -e "\nRecords of all candidates selected for phase1 ...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average,Papers,Salary"
	if [ -s phase1.csv ]
	then
		cat phase1.csv
	else
		echo -e "No candidates selected for this phase."
	fi
}

displayphase2()
{
	echo -e "\nRecords of all candidates selected for phase2 ...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average,Papers,Salary"
	if [ -s phase2.csv ]
	then
		cat phase2.csv
	else
		echo -e "No candidates selected for this phase."
	fi
}

displayphase3()
{
	echo -e "\nRecords of all candidates selected for phase3 ...\n"
	echo "ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average,Papers,Salary"
	if [ -s phase3.csv ]
	then
		cat phase3.csv
	else
		echo -e "No candidates selected for this phase."
	fi
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
