#!/bin/bash -x
echo "Welcome to Flip Coin Combination problem to calculate winning percentage of Head or Tail in Singlet , Doublet and Triptet."
isCheck=1
randomCheck=$((RANDOM%2))
head_value=0
tail_value=0
count=1
declare -a times
declare -A dice_singlet
declare -A dice_doublet
while [ $count -gt 0 ]
do
	for (( i=1; i<=5; i++ ))
	do
		if [ $isCheck -eq $randomCheck ]
		then
			head_value=$(($head_value+1))
			dice_singlet[$(($i+1))]=$head_value
		else
			tail_value=$(($tail_value+1))
			dice_singlet[$(($i+1))]=$head_value
		fi
		((count++))
	done
done
echo "${dice_singlet[@]}"
singlet_percent=$(((1/6)*100))
for(i=0;i<360000;i++)
do
		a=$(((RANDOM%6)+1))
		b=$(((RANDOM%6)+1))
		sum=$(($a+$b))
		times[$sum-2]=$((times[$sum-2]+1))
done

for (( i=1; i<=11; i++ ))
do
	dice_doublet[$(($i+1))]=$(times[$i])
done
echo "${dice_doublet[@]}"
doublet_percent=$(((1/36)*100))
