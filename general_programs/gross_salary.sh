read -p "Enter total numner of employees: " n

for((j = 1; j <= n; j++))
do
	echo " "
	echo "Enter details for employee [$j]..."
	read -p "Basic: " basic
	read -p "DA: " da
	read -p "TA: " ta
	read -p "HRA: " hra
	read -p "Gross: " gross

	gross_pay=`expr $basic + $da + $ta + $hra`
	net_salary=$gross

	echo " "
	echo "Employee [$j]..."
	echo "Gross Pay: $gross_pay"
	echo "Net Salary: $net_salary"
done

