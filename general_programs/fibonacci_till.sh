read -p "Enter the ending number: " n
a=0
b=1  

echo ""
echo "Fibonacci Series: "   

for(( i = 0; i < n; i++ )) 
do
    echo "$a "
    next=`expr $a + $b`
    a=$b 
    b=$next 
done
