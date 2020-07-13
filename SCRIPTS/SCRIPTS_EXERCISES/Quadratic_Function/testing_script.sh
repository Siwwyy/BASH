#!/usr/bin/bash

#DA Copyright (C). All services registered

# This bash script testing quadratic equation

#$1 is a sample file contains sample coefficient value
#$2 is quadratic equation script

while read line ;
do
# sh ./$2 <<< $line  #redirect string input with <<< operator
file_data=$line
echo -e $file_data
echo
done < "$1"