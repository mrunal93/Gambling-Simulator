#!/bin/bash

echo "Welcom to gambling"
read -p "Enter the stake Amount:" stake
read -p "Enter the Bet Amount:" betAmount

winLoose() {
	if [ $(( RANDOM%2 )) == 1 ]
	then
		echo "You Win"
	else
		echo "You Lose"
	fi
}

winLoose
