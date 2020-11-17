#!/bin/bash
echo "Enter an array: "
read -a arr

sorted_arr=($(echo ${arr[*]} | tr " " "\n" | sort -n -r))

echo "Second largest: ${sorted_arr[1]}"
