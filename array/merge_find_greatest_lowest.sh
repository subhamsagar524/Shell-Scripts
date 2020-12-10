#!/bin/bash
grn=$'\e[1;32m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
back=$'\e[41m'

echo -e "\n${cyn}Enter three arrays...${grn}"
read -a arr1
read -a arr2
read -a arr3

merged_arr=(${arr1[*]} ${arr2[*]} ${arr3[*]})
res=(`echo ${merged_arr[*]} | tr " " "\n" | sort -n`)
n=${#res[*]}

echo -e "${back}\nSmallest: ${res[0]}"
echo "Largest : ${res[`expr $n - 1`]}"

