#!/bin/bash
read -p "Enter the number of elements: " n
echo "Enter $n numbers"
read -a arr

count=0
for var in ${arr[*]}
do
	if [ $var -lt 0 ]
	then
		count=`expr $count + 1`
	fi
done

echo "Number of negative elements are: $count"
