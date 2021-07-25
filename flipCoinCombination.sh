#!/bin/bash -x
echo "Welcome to Flip Coin Combination problem to calculate winning percentage of Head or Tail in Singlet , Doublet and Triptet."
isCheck=1
randomCheck=$((RANDOM%2))
if [ $isCheck -eq $randomCheck ]
then
	echo "Head"
else
	echo "Tail"
fi
