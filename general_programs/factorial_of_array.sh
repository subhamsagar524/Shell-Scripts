#!/bin/bash

fact()
{
	prod=1
	for((j=i; j > 0; j--))
	do
		prod=`expr $prod \* $j`
	done

	echo "Factorial of $i is: $prod"
}

read -p "Enter total number of elements: " n
arr=()

echo "Enter $n number of elements..."
for((i = 0; i < n; i++))
do
	read temp
	arr+=($temp)
done

echo ""
echo "Entered array : ${arr[*]}"
echo ""

for i in ${arr[*]}
do
	fact $i
done
