#!/bin/bash

array1=("1" "2" "3" "4" "5")
array2=("6" "7" "8" "9" "0")

new=("${array1[*]}" "${array2[*]}")

echo ${new[*]}

