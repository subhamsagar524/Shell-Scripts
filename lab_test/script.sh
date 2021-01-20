: '
	11) Write a bash script to input n elements 
	    in the range 100-1000000,
	    then count how many armstrong numbers are present,then display
'

#!/bin/bash

# Function to check if the number is armstrong or not
function isArmstrong
{
	count=0
	declare -i i
	for ((i = 100; i <= n; i++))
	do
		sum=0
		item=$i
		l=`expr length $i`
		while [ $item -ne 0 ]
		do
			rem=`expr $item % 10`
			pow=`echo "$rem^$l" | bc`
			sum=`expr $sum + $pow`
			item=`expr $item / 10`
		done

		if [ $sum -eq $i ]
		then
			echo -e "$i, "
			count=`expr $count + 1`
		fi
	done

	echo -e "\nTotal Armstrong numbers: $count"
}

# Driver code
read -p "Enter a number(100-1000000): " n
echo -e "\nArmstrong Numbers are: "

isArmstrong $n
