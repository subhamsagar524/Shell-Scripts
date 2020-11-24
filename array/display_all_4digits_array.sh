#!/bin/bash
read -p "Enter the number of elements: " n
echo "Enter $n numbers"
read -a arr

echo "4 digits numbers in the array are: "
for var in ${arr[*]}
do
	if [ $var -ge 1000 -a $var -le 9999 ]
	then
		echo "$var"
	fi
done
