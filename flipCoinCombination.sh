#!/bin/bash -x
echo "Welcome to Flip Coin Combination problem to calculate winning percentage of Head or Tail in Singlet , Doublet and Triptet."
isCheck=1
randomCheck=$((RANDOM%2))
head_value=0
tail_value=0
count=1
while [ $count -gt 0 ]
do
	for (( i=1; i<=5; i++ ))
	do
		if [ $isCheck -eq $randomCheck ]
		then
			head_value=$(($head_value+1))
			dice[$(($i+1))]=$head_value
		else
			tail_value=$(($tail_value+1))
			dice[$(($i+1))]=$head_value
		fi
		((count++))
	done
done
singlet_percent=$(((1/6)*100))
