#!/bin/bash
echo "Enter array of celcius: "
read -a celcius
echo "Temp in celcius entered are: ${celcius[*]}"

i=1
for c in ${celcius[*]}
do
	f=$(echo "scale=2;((9/5) * $c) + 32" | bc -l)
	echo -e "\nTemperature in celcius $i:"
	echo "Fahrenheit: $f"
	i=`expr $i + 1`
done
