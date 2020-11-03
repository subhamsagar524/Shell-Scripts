#!/bin/bash
echo "Sum of Series of n!/n^n"
read -p "Enter n: " n

sum=0
for((i = 1; i <= n; i++))
do
	fact=1
	for((j = i; j >= 1; j--))
	do
		fact=`expr $fact \* $j`
	done

	power=`echo $i ^ $i | bc -l`
	temp=`echo $fact / $power | bc -l`
	sum=`echo $temp + $sum | bc -l`
done

sum=`printf "%.3f" $sum`
echo "Sum: $sum"
