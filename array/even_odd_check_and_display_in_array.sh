# !/bin/bash 
read -p "Enter total number of elements: " n

i=0
echo "Enter $n elements one by one..."
while [ $i -lt $n ]
do
	read arr[$i]
	i=`expr $i + 1`
done

echo "Full Array entered: ${arr[*]}"
echo "Required numbers to display: "

for((i = 0; i < n; i = i + 2))
do
	if (( ${arr[i]} % 2 == 0 ));
	then
		echo "$i index value=${arr[i]}"
	fi
done

for((i = 1; i < n; i = i + 2))
do
	if (( ${arr[i]} % 2 != 0 ));
	then
		echo "$i index value=${arr[i]}"
	fi
done

