#!/bin/bash

# Color Codes
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

# To print any message in the center of the shell
printCenter()
{
	COLUMNS=$(tput cols)
	COLUMNS=`expr $COLUMNS + 12`
	title=$1
	printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
}

add()
{
	echo ""
	echo "${yel}            Enter candidate's details..."
	read -p "${cyn}              ID: " id
	read -p "${cyn}              Name: " name
	read -p "${cyn}              Post applied: " applied_post
	read -p "${cyn}              Written test mark: " written_mark
	read -p "${cyn}              Skill test mark: " skill_mark
	read -p "${cyn}              Viva Voce mark: " viva_mark
	read -p "${cyn}              Carrier Mark: " carrier_mark
	read -p "${cyn}              No of Papers Published: " papers
	read -p "${cyn}              Salary Expected(in Lakh): " salary

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
	if [ $avg -gt 90 -a $papers -gt 5 ]
	then
		echo "$id,$name,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase2.csv
	fi

	# Determine for phase 3
	if [ $avg -gt 90 -a $papers -gt 5 -a $salary -lt 10 ]
	then
		echo "$id,$name,$applied_post,$written_mark,$skill_mark,$viva_mark,$carrier_mark,$avg,$papers,$salary" >> phase3.csv
	fi
}

displayAll()
{
	echo -e "\n${yel}            Records of all candidates...${cyn}"
	echo "              ID,Name,Post_applied,Written,Skill,Viva,Carrier,Average${grn}"
	if [ -s candidates.csv ]
	then
		cat candidates.csv | sed 's/\(.*\)/              \1/'
	else
		echo -e "          No candidates records available try adding some records first."
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
