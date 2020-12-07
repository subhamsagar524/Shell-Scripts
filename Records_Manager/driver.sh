#!/bin/bash

: '
	This is an record management system to provide functions to,
		- Store records
		- Search records
		- Display records
		- Delete records

	This uses a simple file to store informations.
	Runs in Bash Shell :)

	This scripts operates to store Interviewer Details.

	Recommended to run on a Shell with COLUMNS size nearly 80(+/-5).
'

# General Variables Declarations
# Color Codes
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'



# Functions declarations
# To print any message in the center of the shell
printCenter()
{
	COLUMNS=$(tput cols)
	COLUMNS=`expr $COLUMNS + 12`
	title=$1
	printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
}

# Add records to the file
add()
{
	echo ""
	echo "${yel}            Enter intern details..."
	read -p "${cyn}              Unique ID: ${end}" id
	read -p "${cyn}              Name: ${end}" name
	read -p "${cyn}              Age: ${end}" age
	read -p "${cyn}              Gender: ${end}" gen
	read -p "${cyn}              Marks in three tests: ${end}" line
	read -a marks <<< $line

	# Store the details to a file
	echo "$id,$name,$age,$gen,${marks[*]}" >> records.csv
}

# To display record by a unique attribute(ID)
displayId()
{
	echo ""
	echo "${yel}            Search..."
	read -p "${cyn}              Intern's ID: " id
	grep -w $id records.csv > tempfile

	if [ -s tempfile ]
	then
		echo -e "\n${grn}              Intern Details..."
		details=`cat tempfile | awk -F "," '{print $1}'`
		echo "                ID: $details"
		details=`cat tempfile | awk -F "," '{print $2}'`
		echo "                Name: $details"
		details=`cat tempfile | awk -F "," '{print $3}'`
		echo "                Age: $details"
		details=`cat tempfile | awk -F "," '{print $4}'`
		echo "                Gender: $details"
		details=`cat tempfile | awk -F "," '{print $5}'`
		echo "                Marks in three tests: $details${end}"
	else
		echo -e "\n                ${red}Intern with ID: $id doesn't exists...${end}"
	fi

	rm tempfile
}

# To display all the records present in the file
displayAll()
{
	echo ""
	echo ""
	if [ -s records.csv ]
	then
		echo "${yel}            All records...${grn}"
		cat records.csv | sed 's/\(.*\)/              \1/'
	else
		echo "${red}            No records found... Try adding some records first :)${end}"
	fi
}

# Delete a record by ID
deleteId()
{
	echo ""
	echo ""
	echo "${yel}            Delete..."
	read -p "${cyn}              Intern's ID: " id
	if [ -s records.csv ]
	then
		grep -v $id records.csv > tempfile
		mv tempfile records.csv
		echo "${grn}                Delete Success..."
	else
		echo ""
		echo "${red}                No records found... Try adding some records first :)${end}"
	fi
}

# Driver / Main execution starts here
# Header
echo ""
printCenter "${yel}*** Records Management System ***${end}"
printCenter "${grn}By- Subham Sagar Paira${end}"
echo ""
printCenter "${mag}***************************************************************************${end}"
echo ""

# Now let's prompt the user for the functions
while [ true ]
do
	printCenter "${grn}___________________________________________________________________________${end}"
	echo ""
	echo ""
	printCenter "${cyn}Please choose the options...${end}"
	echo -e "\n          ${yel}1. Add a record"
	echo "          2. Search a record"
	echo "          3. Display all records"
	echo "          4. Delete a record"
	echo "          5. Exit"
	read -p "          ${cyn}Enter a choiche: ${end}" ch

	case $ch in
		1 ) add ;;
		2 ) displayId ;;
		3 ) displayAll ;;
		4 ) deleteId ;;
		5 ) exit 0 ;;
		* ) echo -e "\n ${red}            Invalid Choiche!!! Try Again...${end}\n" ;;
	esac
done
