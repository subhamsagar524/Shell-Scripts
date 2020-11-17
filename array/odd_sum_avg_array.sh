#!/bin/bash
echo "Enter an array: "
read -a arr

sum=0
count=0
for i in ${arr[*]}
do
	temp=`expr $i % 2`
	if [ $temp -ne 0 ]
	then
		sum=`expr $sum + $i`
		((count++))
	fi
done

avg=`echo "scale=2; $sum / $count" | bc -l`
echo "Sum of odd numbers: $sum"
echo "Average of odd numbers: $avg"
