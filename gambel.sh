#!/bin/bash

echo "Welcom to gambling"
stake=100
betAmount=1

winLoose() {
	if [ $(( RANDOM%2 )) == 1 ]
	then
		echo "You Win"
		cash=$(($stake + $betAmount))
	else
		echo "You Lose"
		cash=$(($stake - $betAmount))
	fi
	echo $cash
}

winLoose
