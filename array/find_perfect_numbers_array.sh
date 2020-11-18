echo "Enter a number array: "
read -a num_arr
perfect_numbers=()
not_perfect_numbers=()

for no in ${num_arr[*]}
do
	i=1
	sum=0
	while [ $i -le `expr $no / 2` ]
	do
		if [ `expr $no % $i` -eq 0 ]
		then
			sum=`expr $sum + $i`
		fi
		i=`expr $i + 1`
	done

	if [ $no -eq $sum ]
	then
		perfect_numbers+=($no)
	else
		not_perfect_numbers+=($no)
	fi
done

echo -e "Perfect numbers are: ${perfect_numbers[*]}\nNon Perfect numbers are: ${not_perfect_numbers[*]}"
