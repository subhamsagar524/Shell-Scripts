#!/bin/bash

addSales()
{
	echo -e "\nEnter sales for 12 months: "
	for((i = 0; i < 12; i++))
	do
		read temp
		echo -n "$temp " >> monthly_sales_data.txt
	done
	echo "" >> monthly_sales_data.txt
}

getHighest()
{
	read -p "Enter the month-number(MM) to get the highest sale: " m

	case $m in
		1 ) cat monthly_sales_data.txt | awk -F " " '{print $1}' > test	  ;;
		2 ) cat monthly_sales_data.txt | awk -F " " '{print $2}' > test	  ;;
		3 ) cat monthly_sales_data.txt | awk -F " " '{print $3}' > test	  ;;
		4 ) cat monthly_sales_data.txt | awk -F " " '{print $4}' > test	  ;;
		5 ) cat monthly_sales_data.txt | awk -F " " '{print $5}' > test	  ;;
		6 ) cat monthly_sales_data.txt | awk -F " " '{print $6}' > test	  ;;
		7 ) cat monthly_sales_data.txt | awk -F " " '{print $7}' > test	  ;;
		8 ) cat monthly_sales_data.txt | awk -F " " '{print $8}' > test	  ;;
		9 ) cat monthly_sales_data.txt | awk -F " " '{print $9}' > test	  ;;
		10 ) cat monthly_sales_data.txt | awk -F " " '{print $10}' > test ;;
		11 ) cat monthly_sales_data.txt | awk -F " " '{print $11}' > test ;;
		12 ) cat monthly_sales_data.txt | awk -F " " '{print $12}' > test ;;
		* ) echo "Invalid Month..."; exit 0	;;
	esac
	
	data=`cat test | tr " " "\n" | sort -nr`
	rm test

	echo -e "\nSale for the month $m..."
	echo $data
}

echo "Sales Records..."
while true
do
	echo -e "\n1. Add sales data."
	echo "2. Get highest sale of month."
	echo "3. Exit"
	read -p "Enter your choiche: " ch
	case $ch in
		1 ) addSales	;;
		2 ) getHighest	;;
		3 ) exit 0		;;
		* ) echo -e "\nInvalid Input..."
						;;
	esac
done
