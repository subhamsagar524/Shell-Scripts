read -p "Enter Selling Price: " sellp
read -p "Enter Cost Price: " costp

profit=$(($sellp-$costp))
loss=$(($costp-$sellp))
hundred=100
zero=0
negone=-1
pperc=$((($profit/$costp)*$hundred))
loss=$(($loss*$negone))
lperc=$((($loss/$costp)*$hundred))

if [ $profit -ge $zero ]
then
        echo "Profit is $profit or $pperc%."
else
	echo "Loss is $loss or $lperc%."
fi

