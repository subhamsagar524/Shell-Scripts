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
	echo ""
	read -p "Enter the month-number(MM) to get the highest sale: " m

	case $m in
		1 ) cat monthly_sales_data.txt | awk -F " " '{print $1}' | sort>test	  ;;
		2 ) cat monthly_sales_data.txt | awk -F " " '{print $2}' | sort>test	  ;;
		3 ) cat monthly_sales_data.txt | awk -F " " '{print $3}' | sort>test	  ;;
		4 ) cat monthly_sales_data.txt | awk -F " " '{print $4}' | sort>test	  ;;
		5 ) cat monthly_sales_data.txt | awk -F " " '{print $5}' | sort>test	  ;;
		6 ) cat monthly_sales_data.txt | awk -F " " '{print $6}' | sort>test	  ;;
		7 ) cat monthly_sales_data.txt | awk -F " " '{print $7}' | sort>test	  ;;
		8 ) cat monthly_sales_data.txt | awk -F " " '{print $8}' | sort>test	  ;;
		9 ) cat monthly_sales_data.txt | awk -F " " '{print $9}' | sort>test	  ;;
		10 ) cat monthly_sales_data.txt | awk -F " " '{print $10}' | sort>test ;;
		11 ) cat monthly_sales_data.txt | awk -F " " '{print $11}' | sort>test ;;
		12 ) cat monthly_sales_data.txt | awk -F " " '{print $12}' | sort>test ;;
		* ) echo "Invalid Month..."; exit 0	;;
	esac

	i=0
	while read x
	do
		a[$i]=$x
		((i++))
	done < test
	rm test
	
	l=`expr ${#a[*]} - 1`
	echo "Sales for month $m..."
	echo Min sale=${a[0]}
	echo Max sale=${a[$l]}
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
