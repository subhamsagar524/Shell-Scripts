#!/bin/bash
echo -e "\nEnter numerator array: "
read -a n
echo -e "\nEnter denominator array: "
read -a d

result=()
len_n=${#n[*]}
len_d=${#d[*]}
echo -e "\nLength of numerator = $len_n\nLength of denominator = $len_d\n"

if [ $len_n -eq $len_d ]
then
	i=0
	for (( i = 0; i < $len_n; i++ ))
	do
		result+=(`echo "scale=2; ${n[i]} / ${d[i]}" | bc -l`)
	done

	echo "Result: ${result[*]}"
else
	echo "Array should be of same length..."
fi
