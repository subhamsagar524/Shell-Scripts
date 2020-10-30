#!/bin/bash

read -p "Enter an integer: " num

function prime
{
	for((i=2; i<=num/2; i++))
	do
  		if [ $((num%i)) -eq 0 ]
  		then
    		echo "Not Prime Number"
    		exit
  		fi
	done
	
	echo "Prime number"
}	

result=`prime $number`
echo "$result"
