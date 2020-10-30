#!/bin/bash

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

sum=0
for i in ${arr[*]}
do
	sum=`echo $sum + $i | bc -l`
done

echo ""
echo "Sum: $sum"
avg=`echo $sum / $n | bc -l`
echo "Avg: $avg"

