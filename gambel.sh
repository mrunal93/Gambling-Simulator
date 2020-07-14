#!/bin/bash 


echo "Welcom to gambling"

STAKE=100
BET_AMOUNT=1
declare -A gambler
declare -A gamblerLuck
winCash=0
lostCash=0
totalAmount=0
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
			if [ $(( RANDOM%2 )) -eq 1 ]
			then
				cash=$(($cash + $BET_AMOUNT))
			else
				cash=$(($cash - $BET_AMOUNT))
			fi
		done

	        if [ $cash -gt 100 ]
        	then
			winCash=$(( winCash +  $newStake ))
			echo "FOR DAY" $day "YOU HAVE $"$winCash "Won $" $newStake


		else
			lostCash=$(($lostCash + $newStake ))
                         echo "FOR DAY" $day "YOU have  $"$lostCash "Lost $" $newStake
		fi
		gambler[$day]=$(( $STAKE - $cash ))

	done
	echo -e "Days won and lost: ${!gambler[@]} \nBy the Amount: ${gambler[@]} \nTotal winning cash:$winCash \nTotal losing cash: $lostCash"
	}

gamblerLuck() {
	for (( lDay=2; lDay <=30; lDay++ ))
	do

		gamblerLuck[$lDay]=$(( ${gambler[$lDay]} + ${gambler[$lDay]} ))
	done
	luckDay=1
	unLuckyDay=1
	luck=${gambler[1]}
	unLuck=${gambler[1]}
	for ((lDay=2; lDay<=30; lDay++ ))
	do
		if [ ${gamblerLuck[$lDay]} -gt $luck ]
		then
			luck=${gamblerLuck[$lDay]}
			luckDay=$lDay
		elif [ ${gamblerLuck[$lDay]} -lt $unLuck ]
		then
			unluck=${gamblerLuck[$lDay]}
			unLuckyDay=$lDay
		fi
	done
	echo -e "Gambler Luckiest Day: $luckDay \nGambler UnLuckiest Day: $unLuckyDay"
}

monthExtend() {
	 gambling
         gamblerLuck

	if [ $winCash -gt $lostCash ]
	then
		echo "Gambler should continued For next Month"
	else
		echo "Gambler should stop Gambling for next Month"
	fi
}
monthExtend
