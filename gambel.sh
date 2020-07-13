#!/bin/bash 


echo "Welcom to gambling"

STAKE=100
BET_AMOUNT=1
declare -A gambler
declare -A gamblerLuck
gambling() {
	winCash=100
	lostCash=100
	percentStake=$(($STAKE * 50 / 100))
	MIN_STAKE=$(($STAKE - $percentStake))
	MAX_STAKE=$(($STAKE + $percentStake))
	FOR_WIN=1
	for (( day=1; day<=30; day++ ))
	do
		cash=$STAKE
		while (( $cash > $MIN_STAKE && $cash < $MAX_STAKE ))
		do
			if [ $(( RANDOM%2 )) -eq $FOR_WIN ]
			then
				cash=$(($cash + $BET_AMOUNT))
			else
				cash=$(($cash - $BET_AMOUNT))
			fi
		done
		 gambler[$day]=$(( $STAKE - $cash ))

	        if [ $cash -gt 100 ]
        	then
                	winCash=$((winCash + $cash ))
			echo "FOR DAY" $day "YOU HAVE won $"$winCash
        	else
                	lostCash=$((lostCash + $cash ))
			echo "FOR DAY" $day "YOU have Loss $"$lostCash
        	fi

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

gambling
gamblerLuck
