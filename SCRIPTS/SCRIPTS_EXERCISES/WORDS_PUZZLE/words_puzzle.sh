#!/usr/bin/bash

# This bash script makes a puzzle word fun 

Size=10

#FUNCTIONS
function Generate_Row 
{
    Row=()
    String=$1
    Words=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l") #sample characters to fill space
    Word_Length=${#1}
    Word_Position_Begin=0
    if [[ $Word_Length -gt 0 ]];
    then
        Word_Position_Begin=$(( $Word_Length % $((( RANDOM % $Word_Length ) + 1)) ))
    else
        Word_Position_Begin=$(( $Word_Length % $((( RANDOM % 9 ) + 1)) ))
    fi
    
    Counter=0

    for ((i = 0 ; i < $Size ; i++));
    do
        if [[ $i -lt $Word_Position_Begin || $i -ge $(($Word_Position_Begin+$Word_Length)) ]]; 
        then
            Row+=${Words[$(( ( RANDOM % ${#Words[*]} ) ))]}
        else
            Row+=${String[($Counter)]}
            #echo ${String[0]}
            Counter=$((Counter+1))
        fi
        
    done

    echo -e $Row
}

###################################################################
###################################################################

echo -e "Write words to words game (max $Size with max length $Size) and divide them by space (eg. Hello World Linux) and press enter:"

read -a ARGUMENTS

set -- $ARGUMENTS

if [[ ${#ARGUMENTS[*]} -le $Size ]]; 
then
    for ((j = 0 ; j < $Size ; j++));
    do
        Generate_Row ${ARGUMENTS[$j]}
    done
else
    echo -e "Too many arguments given"
fi