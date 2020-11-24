#!/bin/bash
read -p "Enter the number of elements: " n
echo "Enter $n numbers"
read -a arr

echo -e "\nNon-zero elements are: "
for var in ${arr[*]}
do
	if [ $var -ne 0 ]
	then
		echo "$var"
	fi
done
