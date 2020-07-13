#!/bin/bash

echo "Welcom to gambling"
STAKE=100
BET_AMOUNT=1
gambling() {
	winCash=0
	lostCash=0
	percentStake=$(($STAKE * 50 / 100))
	minStake=$(($STAKE - $percentStake))
	maxStake=$(($STAKE + $percentStake))
	forWin=1
	for (( day=1; day<=20; day++ ))
	do
		cash=$STAKE
		while (( $cash > $minStake && $cash < $maxStake ))
		do
			if [ $(( RANDOM%2 )) -eq $forWin ]
			then
				#echo "You Win"
				cash=$(($cash + $BET_AMOUNT))
			else
				#echo "You Lose"
				cash=$(($cash - $BET_AMOUNT))
			fi
		done


		if [ $cash -gt 100 ]
		then
			winCash=$((winCash + 50 ))
		else
			lostCash=$((lostCash + 50 ))
		fi
	done
	echo -e "Total winning cash:$winCash \nTotal losing cash: $lostCash"
	}

gambling
