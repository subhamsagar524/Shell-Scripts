#!/bin/bash

original=("1" "2" "3" "4" "5")
echo "Initial Array: ${original[*]}"

temp=${original[1]}
original[1]=${original[0]}
original[0]=$temp
echo "Initial Array after Swapping: ${original[*]}"

new=("6" "7" "8" "9" "0")
echo "New Array: ${new[*]}"

temp=${new[1]}
new[1]=${new[0]}
new[0]=$temp
echo "New Array after Swapping: ${new[*]}"

merged=("${original[*]}" "${new[*]}")
echo "Both swapped array after merged: ${merged[*]}"

