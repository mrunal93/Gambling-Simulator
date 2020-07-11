#!/bin/bash

echo "Welcom to gambling"
#read -p "Enter the stake Amount:" stake
#read -p "Enter the Bet Amount:" betAmount
stake=100
betAmount=1
gambling() {
	percentStake=$(($stake * 50 / 100))
	minStake=$(($stake - $percentStake))
	maxStake=$(($stake + $percentStake))
	win=1
	cash=$stake
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
