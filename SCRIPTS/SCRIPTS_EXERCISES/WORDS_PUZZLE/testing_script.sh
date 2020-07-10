#!/usr/bin/bash

#DA Copyright (C). All services registered

# This bash script testing words puzzle game

#$1 is a sample file contains max 10 sample words
#$2 is a words puzzle game

Times=10    #how many times we want to run and loop
for (( i=0; i<$Times ; i++ )); 
do
    sh ./$2 <<< $(<$1)  #redirect string input with <<< operator
    echo -e
done