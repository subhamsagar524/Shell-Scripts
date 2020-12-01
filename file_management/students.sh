#!/bin/bash
addStudent()
{
	echo ""
	read -p "Regd No: " sregd
	read -p "Name: " sname
	echo "Enter marks in three subjects"
	read -a smarks

	# Store the details to a file
	echo "$sregd $sname ${smarks[*]}" >> students_recored.txt
}

displayStudentbyRegd()
{
	echo ""
	read -p "Enter Regd No to display: " sregd
	grep -w $sregd students_recored.txt > tempfile

	if [ -s tempfile ]
	then
		echo -e "\nStudents Details..."
		details=`cat tempfile | awk -F " " '{print $1}'`
		echo "Regd No : $details"
		details=`cat tempfile | awk -F " " '{print $2}'`
		echo "Name    : $details"
		details=`cat tempfile | awk -F " " '{print $3}'`
		echo "Mark 1  : $details"
		details=`cat tempfile | awk -F " " '{print $4}'`
		echo "Mark 2  : $details"
		details=`cat tempfile | awk -F " " '{print $5}'`
		echo "Mark 3  : $details"
	else
		echo -e "\Student with Regd No $sregd doesn't exists..."
	fi

	rm tempfile
}

displayAllRecords()
{
	echo -e "\nRecords of all students...\n"
	echo "RegdNo Name Mark1 Mark2 Mark3"
	cat students_recored.txt
}

echo "Storing of details of Students..."
while [ true ]
do
	echo -e "\n1. Add record of Students"
	echo "2. Display all the records"
	echo "3. Display record of Students"
	echo "4. Exit"
	read -p "Enter a choiche: " ch

	case $ch in
		1 ) addStudent ;;
		2 ) displayAllRecords ;;
		3 ) displayStudentbyRegd ;;
		4 ) exit 0 ;;
		* ) echo -e "\n Invalid Choiche!!! Try Again...\n"
	esac
done
