#!/bin/bash

echo "Welcom to gambling"
STAKE=100
BET_AMOUNT=1
declare -A gambler

gambling() {
	winCash=0
	lostCash=0
	percentStake=$(($STAKE * 50 / 100))
	minStake=$(($STAKE - $percentStake))
	maxStake=$(($STAKE + $percentStake))
	forWin=1
	for (( day=1; day<=30; day++ ))
	do
		cash=$STAKE
		while (( $cash > $minStake && $cash < $maxStake ))
		do
			if [ $(( RANDOM%2 )) -eq $forWin ]
			then
				cash=$(($cash + $BET_AMOUNT))
			else
				cash=$(($cash - $BET_AMOUNT))
			fi
		done
		gambler[$day]=$(( $cash - $STAKE))

		if [ $cash -gt 100 ]
		then
			winCash=$((winCash + 50 ))
		else
			lostCash=$((lostCash + 50 ))
		fi
	done
	echo -e "Total winning cash:$winCash \nTotal losing cash: $lostCash \nDays won and lost: ${!gambler[@]} \nBy the Amount: ${gambler[@]}"
	}

gambling
