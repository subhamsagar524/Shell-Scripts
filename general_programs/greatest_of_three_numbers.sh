#!/bin/bash

getMax()
{
	max=$a
	if [ $b -ge $max ]
	then
		max=$b
	fi

	if [ $c -ge $max ]
	then
		max=$c
	fi

	echo "Largest among all is: $max"
}

echo "Enter three numbers: "
read a
read b
read c

getMax $a $b $c

