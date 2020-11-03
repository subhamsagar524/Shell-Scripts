#!/bin/bash

getCashback()
{
	supercoin=`echo $total \* 0.01 | bc -l`

	# Cashback is 2 rupess per supercoin
	cashback=`echo $supercoin \* 2 | bc -l`

	# Display the details of customer and cashback
	echo ""
	echo "Congratulation $name!"
	echo "You have earned $supercoin supercoins."
	echo "You saved $cashback."

	# Store the details to a file
	echo "******************************************************************" >> stored_cashback_data.txt
	echo "Name          : $name" >> stored_cashback_data.txt
	echo "Cust ID       : $cid" >> stored_cashback_data.txt
	echo "Address       : $addr" >> stored_cashback_data.txt
	echo "Mob No        : $mob" >> stored_cashback_data.txt
	echo "Total Purchase: $total" >> stored_cashback_data.txt
	echo "Current Year  : $cyear" >> stored_cashback_data.txt
	echo "Supercoin     : $supercoin" >> stored_cashback_data.txt
	echo "Cashback      : $cashback" >> stored_cashback_data.txt
	echo "******************************************************************" >> stored_cashback_data.txt
	echo " " >> stored_cashback_data.txt
}

echo "Enter customer's details..."
read -p "Name: " name
read -p "Cust ID: " cid
read -p "Address: " addr
read -p "Mob No: " mob
read -p "Total Purchase: " total
read -p "Current Year: " cyear

getCashback $name $cid $addr $mob $total $cyear
