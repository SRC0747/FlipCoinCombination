#!/bin/bash -x
echo "Welcome to Flip Coin Combination problem to calculate winning percentage of Head or Tail in Singlet , Doublet and Triptet."
isCheck=1
randomCheck=$((RANDOM%2))
head_value=0
tail_value=0
count=1
declare -a times
declare -a times_triplet
declare -A dice_singlet
declare -A dice_doublet
declare -A dice_triplet
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
			dice_singlet[$(($i+1))]=$tail_value
		fi
		((count++))
	done
done
echo "${dice_singlet[@]}"
singlet_percent=$(((1/2)*100))
for (( i=0;i<360000;i++ ))
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
doublet_percent=$(((1/6)*100))
for (( i=0;i<360000;i++ ))
do
                a=$(((RANDOM%6)+1))
                b=$(((RANDOM%6)+1))
		c=$(((RANDOM%6)+1))
		total=$(($a+$b+$c))
                times_triplet[$total-2]=$((times_triplet[$total-2]+1))
done
for (( i=1; i<=11; i++ ))
do
        dice_triplet[$(($i+1))]=$(times_triplet[$i])
done
echo "${dice_triplet[@]}"
triplet_percent=$(((1/36)*100))
if [ $singlet_percent -gt $doublet_percent ]
then
	temp=$singlet_percent
	lowest=$doublet_percent
else
	temp=$doublet_percent
        lowest=$singlet_percent
fi

if [ $temp -gt $triplet_percent ]
then
	highest=$temp
	if [ $lowest -gt $triplet_percent ]
	then
		temp=$lowest
		lowest=$triplet_percent
	else
		temp=$triplet_percent
	fi
else
	highest=$triplet_percent
fi

echo "$lowest is on the third position of winning combination."
echo "$temp is on the second position of winning combination."
echo "$highest is on the first position of winning combination."


