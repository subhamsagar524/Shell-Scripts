#!/bin/bash

findWaitingTime()
{
	wt[0]=0

	for((i = 1; i < n; i++))
	do
		t=`expr $i - 1`
		wt[$i]=`echo "${brust_time[$t]} + ${wt[$t]}" | bc -l`
	done
}

findTurnAroundTime()
{
	for((i = 0; i < $n; i++))
	do
		tat[$i]=`echo "${brust_time[$i]} + ${wt[$i]}" | bc -l`
	done
}

findavgTime()
{
	wt=()
	tat=()
	total_wt=0
	total_tat=0

	findWaitingTime ${processes[*]} $n ${brust_time[*]} ${wt[*]}

	findTurnAroundTime ${processes[*]} $n ${brust_time[*]} ${wt[*]} ${tat[*]}

	echo -e "\nProcesses    Brust time    Waiting Time    Turn Around Time\n"
	for((i = 0; i < $n; i++))
	do
		total_wt=`echo "$total_wt + ${wt[$i]}" | bc -l`
		total_tat=`echo "$total_tat + ${tat[$i]}" | bc -l`
		echo "    ${processes[$i]}            ${brust_time[$i]}              ${wt[$i]}                ${tat[$i]}"
	done

	avgwt=`echo "scale=2; $total_wt / $n" | bc -l`
	avgtat=`echo "scale=2; $total_tat / $n" | bc -l`

	echo -e "\nAverage Waiting Time: $avgwt"
	echo "Average Turn Around Time: $avgtat"
}

# Driver
echo "Enter processes IDs: "
read -a processes

echo "Enter brust times: "
read -a brust_time

n=`echo ${#brust_time[*]}`

findavgTime ${processes[*]} $n ${brust_time[*]}
