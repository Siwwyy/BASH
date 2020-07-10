#!/usr/bin/bash

#DA Copyright (C). All services registered

#echo $1 $2 $3

#Quadratic equation script, a=$1, b=$2 and c=$3 (coefficients)

if [[ $1 = 0 ]]; 
then
    echo "Not a quadratic equation.";
    exit 0;
fi

delta=$(($2*$2-4*$1*$3))


if [[ $delta -gt 0 ]] ; 
then
	echo -n "x1 = "
    echo -e "scale=3\n0.5*(-($2)+sqrt($delta))/($1)" | bc
	echo -n "x2 = "
    echo -e "scale=3\n0.5*(-($2)-sqrt($delta))/($1)" | bc
elif [[ $delta -eq 0 ]] ; 
then
	echo -n "x = "
    echo -e "scale=3\n(-($2)/(2*$1))" | bc
else
	echo -e "This function doesnt have roots"
fi
