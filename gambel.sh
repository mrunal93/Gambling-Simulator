#!/bin/bash 


echo "Welcom to gambling"

stake=100
betAmount=1
declare -A gambler
declare -A gamblerLuck
gambling() {
	winCash=0
	lostCash=0
	percentStake=$(($stake * 50 / 100))
	minStake=$(($stake - $percentStake))
	maxStake=$(($stake + $percentStake))
	forWin=1
	for (( day=1; day<=20; day++ ))
	do
		cash=$stake
		while (( $cash > $minStake && $cash < $maxStake ))
		do
			if [ $(( RANDOM%2 )) -eq $forWin ]
			then
				cash=$(($cash + $betAmount))
			else
				cash=$(($cash - $betAmount))
			fi
		done
		 gambler[$day]=$(( $stake - $cash ))

	        if [ $cash -gt 100 ]
        	then
                	winCash=$((winCash + 50 ))
        	else
                	lostCash=$((lostCash + 50 ))
        	fi

	done
	echo -e "Days won and lost: ${!gambler[@]} \nBy the Amount: ${gambler[@]}"
	echo -e "Total winning cash:$winCash \nTotal losing cash: $lostCash"
	}

gamblerLuck() {
	for (( lDay=2; lDay <=20; lDay++ ))
	do

		gamblerLuck[$lDay]=$(( ${gambler[$lDay]} + ${gambler[$lDay]} ))
	done
	luckDay=1
	unLuckyDay=1
	luck=${gambler[1]}
	unLuck=${gambler[1]}
	for ((lDay=2; lDay<=20; lDay++ ))
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
