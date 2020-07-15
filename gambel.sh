#!/bin/bash


echo "Welcom to gambling"

STAKE=100
BET_AMOUNT=1
declare -A gambler
winCash=0
lostCash=0
winTemp=0
winDay=0
loseDay=0
loseTemp=0
cash=0
bet=1

gambling() {
	cash=$(($cash+$STAKE))
	newStake=$(($cash/2))
	minStake=$(($cash - $newStake))
	maxStake=$(($cash + $newStake))
	for (( day=1; day<=30; day++ ))
	do
		cash=$STAKE
		while [[ $cash -lt $maxStake ]] && [[ $cash -gt $minStake ]]
		do
			if [ $(( RANDOM%2 )) -eq $bet ]
			then
				cash=$(($cash + $BET_AMOUNT))
			else
				cash=$(($cash - $BET_AMOUNT))
			fi
		done

	        if [ $cash -gt $newStake ]
        	then
			gamblerUnLuck
			lostCash=$(( lostCash +  $newStake ))
			echo "FOR DAY" $day "YOU HAVE Lost $"$lostCash
		else
			gamblerLuck
			winCash=$(( winCash + $newStake))
			echo "FOR DAY" $day "You Have Won $ "$winCash

		fi

	done
	echo -e "Total winning cash:$winCash \nTotal losing cash: $lostCash "
}

gamblerLuck() {
	if [[ $loseTemp -lt $newStake ]]
	then
		loseTemp=$(($newStake))
		loseDay=$(($day))
	fi
}

gamblerUnLuck() {
	if [[ $winTemp -lt $newStake ]]
	then
		winTemp=$(($newStake))
		winDay=$(($day))
	fi
}

monthExtend() {
	gambling
        gamblerLuck
	echo -e "Your Unluckiest day is $loseDay you lost $loseTemp \nYour luckiest day is $winDay you won $winTemp"
	if [ $winCash -gt $lostCash ]
	then
		echo "Gambler should continued For next Month"
	else
		echo "Gambler should stop Gambling for next Month"
	fi
}
monthExtend
