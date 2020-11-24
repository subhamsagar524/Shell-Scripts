#!/bin/bash
read -p "Enter the number of elements: " n
echo -e "\nEnter $n elements"
read -a arr

echo "Entered array: ${arr[*]}"
echo -e "\nEnter positions for coping: "
read -a ind

new_arr=()
sorted_ind=($(echo ${ind[*]} | tr " " "\n" | sort -n))
echo "Sorted Positions: ${sorted_ind[*]}"

for var in ${sorted_ind[*]}
do
	var=`expr $var - 1`
	new_arr+=(${arr[$var]})
done

echo -e "\nCopied array with positions are: "
echo "${new_arr[*]}"
