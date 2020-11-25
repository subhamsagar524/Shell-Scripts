echo -e "\nEnter an array of numbers: "
read -a arr

fact=1
echo -e "\nFactorials..."
for var in ${arr[*]}
do
	if [ $var -lt 0 ]
	then
		echo "$var  ->  Invalid: negative number"
	elif [ $var -eq 0 -o $var -eq 1 ]
	then
		echo "$var   ->  1"
	else
		for (( i = $var; i > 1; i-- ))
		do
			fact=`expr $fact \* $i`
		done
		echo "$var   ->  $fact"
		fact=1
	fi
done
