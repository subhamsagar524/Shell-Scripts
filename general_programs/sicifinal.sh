#!/bin/sh

read -p "Enter Principle: " pr
read -p "Enter the Rate of Interest: " rate
read -p "Enter the term: " time

si=`echo $pr \* $rate \* $time | bc -l`
si1=`echo $si / 100 | bc -l`

temp=`echo 1 + $rate / 100 | bc -l`
temptime=`echo $temp ^ $time | bc -l`
ci=`echo $pr \* $temptime | bc -l`

final=`echo $pr + $si1 | bc -l`

echo "Simple Interest: $si1"
echo "Compound Interest: $ci"
echo "Final: $final"

