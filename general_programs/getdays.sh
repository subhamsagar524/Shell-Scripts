while true
do
	echo ""
	read -p "Enter the number of the day: " day
	case $day in
		1)echo "Monday"	;;
		2)echo "Tuesday"	;;
		3)echo "Wednesday"	;;
		4)echo "Thursday"	;;
		5)echo "Friday"	;;
		6)echo "Saturday"	;;
		7)echo "Sunday"	;;
		*)echo "Invalid Day.. Enter day between 1 and 7..."	;;
	esac

	echo ""
	read -p "Do you want to try again (1:Yes / 0:No)? " ch
	if [ $ch -eq  0 ]
	then
		exit 0
	fi
done
