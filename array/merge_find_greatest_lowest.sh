#!/bin/bash
grn=$'\e[1;32m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
back=$'\e[41m'

echo -e "\n${cyn}Enter three arrays...${grn}"
read -a arr1
read -a arr2
read -a arr3

res=(${arr1[*]} ${arr2[*]} ${arr3[*]})
n=${#res[*]}

for ((i=0; i<n; i++))
do
	for ((j=$i; j<n; j++))
	do
		if [[ ${res[$i]} > ${res[$j]} ]];
		then
			temp=${res[$i]}
			res[$i]=${res[$j]}
			res[$j]=$temp
		fi
	done
done
echo ${res[*]}
echo -e "${back}\nSmallest: ${res[0]}"
echo "Largest : ${res[`expr $n-1`]}"
