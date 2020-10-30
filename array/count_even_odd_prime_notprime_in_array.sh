# !/bin/bash 
read -p "Enter total number of elements: " n

i=0
echo "Enter $n elements one by one..."
while [ $i -lt $n ]
do
    read arr[$i]
    i=`expr $i + 1`
done

flag=0
count_even=0
count_odd=0
count_prime=0
count_not_prime=0
i=0

while [ $i -lt ${#arr[@]} ] 
do
	temp=${arr[$i]}
	flag=0
	if [ $((temp % 2)) -eq 0 ]
	then
		count_even=`expr $count_even + 1`
	else
		count_odd=`expr $count_odd + 1`
	fi

	for((j=2; j<=temp/2; j++))
	do
		if [ $((temp%j)) -eq 0 ]
  		then
   			flag=1
  		fi
	done
	
	if [ $flag -eq 1 ]
	then
		count_not_prime=`expr $count_not_prime + 1`
	else
		count_prime=`expr $count_prime + 1`
	fi

	i=`expr $i + 1`
done

echo "No of evens: $count_even"
echo "No of odds: $count_odd"
echo "No of primes: $count_prime"
echo "No of non-primes: $count_not_prime"
