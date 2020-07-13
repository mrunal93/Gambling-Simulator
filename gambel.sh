#!/bin/bash

echo "Welcom to gambling"
STAKE=100
BET_AMOUNT=1

winLoose() {
	if [ $(( RANDOM%2 )) == 1 ]
	then
		echo "You Win"
		cash=$(($STAKE + $BET_AMOUNT))
	else
		echo "You Lose"
		cash=$(($STAKE - $BET_AMOUNT))
	fi
	echo $cash
}

winLoose
