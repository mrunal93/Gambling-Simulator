#!/bin/bash

echo "Welcom to gambling"
STAKE=100
BET_AMOUNT=1
gambling() {
	percentStake=$(($STAKE * 50 / 100))
	minStake=$(($STAKE - $percentStake))
	maxStake=$(($STAKE + $percentStake))
	win=1
	cash=$STAKE
	while (( $cash > $minStake && $cash < $maxStake ))
	do
		if [ $(( RANDOM%2 )) -eq $win ]
		then
			echo "You Win"
			cash=$(($cash + $betAmount))
		else
			echo "You Lose"
			cash=$(($cash - $betAmount))
		fi
	done
	echo $cash
}

gambling
