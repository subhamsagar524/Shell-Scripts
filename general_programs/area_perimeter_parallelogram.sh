echo "Enter the details of parallelogram"
read -p "Enter height: " height
read -p "Enter base: " base
read -p "Enter side: " side

per=`echo $side + $side + $base + $base | bc -l`
area=`echo $height \* $base | bc -l`

echo -e "\nPerimeter: $per"
echo "Area: $area"
