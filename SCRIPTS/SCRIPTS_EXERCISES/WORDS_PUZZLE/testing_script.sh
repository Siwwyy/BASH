#!/usr/bin/bash

# This bash script testing words puzzle game

#$1 is a words puzzle game
#$2 is a sample file contains max 10 sample words

Times=10
for (( i=0; i<$Times ; i++ )); 
do
    sh ./$2 | cat $1
done