#!/bin/bash

echo "Welcom to gambling"
#read -p "Enter the stake Amount:" stake
#read -p "Enter the Bet Amount:" betAmount
stake=100
betAmount=1
declare -A gambler

gambling() {
	winCash=0
	lostCash=0
	percentStake=$(($stake * 50 / 100))
	minStake=$(($stake - $percentStake))
	maxStake=$(($stake + $percentStake))
	forWin=1
	for (( day=1; day<=20; day++ ))
	do
		cash=$stake
		while (( $cash > $minStake && $cash < $maxStake ))
		do
			if [ $(( RANDOM%2 )) -eq $forWin ]
			then
				echo "You Win"
				cash=$(($cash + $betAmount))
			else
				echo "You Lose"
				cash=$(($cash - $betAmount))
			fi
		done
		gambler[$day]=$(( $cash - $stake))

		if [ $cash -gt 100 ]
		then
			winCash=$((winCash + 50 ))
		else
			lostCash=$((lostCash + 50 ))
		fi
	done
	echo -e "Total winning cash:$winCash \nTotal losing cash: $lostCash"
	echo -e "Days won and lost: ${!gambler[@]} \nBy the Amount: ${gambler[@]}"
	}

gambling
