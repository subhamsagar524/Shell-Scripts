read -p "Enter the number: " n

rem=0
cnt=0
echo " "
echo "Digits Extracted: "
while [ $n -ne 0 ]
do
	rem=$(( $n % 10 ))
	n=$(( $n / 10 )) 
	cnt=$(( $cnt + 1))
	echo "$rem"
done

echo "Number of digits: $cnt"

