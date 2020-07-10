#!/usr/bin/bash

#DA Copyright (C). All services registered

# This bash script makes a puzzle word fun 

#Usage: just write words u want by user input after script is runned

Size=10

#FUNCTIONS
function Generate_Row 
{
    Row=()  #row to display
    String=$1   #our string
    Words=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l") #sample characters to fill space
    Word_Length=${#1}   #string argument length
    Word_Position_Begin=0   #word position
    if [[ $Word_Length -gt 0 ]];    #if row is greater than 0 we can easly get a random position
    then
        Word_Position_Begin=$(( $Word_Length % $((( RANDOM % $Word_Length ) + 1)) )) #eg. 5 % RAND 5 + 1
    else
        Word_Position_Begin=$(( $Word_Length % $((( RANDOM % 9 ) + 1)) )) #eg. 0 % RAND 9 + 1
    fi
    
    Counter=0  #counter through Words array

    for ((i = 0 ; i < $Size ; i++));    #size means amount of hidden words size=5 we will get 5x5 matrix
    do
        if [[ $i -lt $Word_Position_Begin || $i -ge $(($Word_Position_Begin+$Word_Length)) ]];  #we covered word with length 4 on position from 2 to 6, then position 0,1...7,8,9 will be randomly filled with Words array
        then
            Row+=${Words[$(( ( RANDOM % ${#Words[*]} ) ))]} #fill Row with random character
        else
            Row+=${String[($Counter)]}  #fill with our given word
            Counter=$((Counter+1))  #counter++, incrementation
        fi
        
    done

    echo -e $Row    #display word
}

###################################################################
###################################################################

echo -e "Write words to words game (max $Size with max length $Size) and divide them by space (eg. Hello World Linux) and press enter:"

read -a ARGUMENTS   #read arguments from user input

set -- $ARGUMENTS   #set the variable ARGUMENTS

if [[ ${#ARGUMENTS[*]} -le $Size ]];    #if we set amount of arguments eg. 10 we cannot fill our game with bigger ammount of arguments
then
    for ((j = 0 ; j < $Size ; j++));
    do
        Generate_Row ${ARGUMENTS[$j]}   #Size times loop over and Size times call Generate Row
    done
else
    echo -e "Too many arguments given"
fi