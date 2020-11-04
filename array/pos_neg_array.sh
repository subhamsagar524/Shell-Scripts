#!/bin/bash

read -p "Enter total number of elements: " n

i=0
echo "Enter $n elements one by one..."
while [ $i -lt $n ]
do
	read arr[$i]
	i=`expr $i + 1`
done

pos=0
neg=0

for i in "${arr[@]}"
do
	if [ $i -lt 0 ]
	then
		((neg++))
	elif [ $i -gt 0 ]
	then
		((pos++))
	fi
done

echo "Positive: $pos"
echo "Negative: $neg"

