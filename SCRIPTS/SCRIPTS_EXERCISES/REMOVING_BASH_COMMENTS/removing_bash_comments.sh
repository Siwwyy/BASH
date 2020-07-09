#!/usr/bin/bash

# This bash script which removes commentary from other bash scripts


for file_name in $*	#loop through each argument given by user
do
	file_data_to_save=()	#file data after transformation 

	while read line ;
	do
	# reading each line
	if grep -q -w "#!" <<< $line ;	#looking for first bash header
	then
		file_data_to_save+=($line)
		file_data_to_save+=('\n')
	elif grep -q "#" <<< $line ; #looking for rest of commentary in file, eg. var=$(cd) #hello or #var=$(cd)
	then
		tmp="${line%%#*}"
		file_data_to_save+=(${line:head:${#tmp}})	# #tmp gives length
		file_data_to_save+=('\n')
	fi
	done < "$file_name"
	echo -e ${file_data_to_save[*]} > $file_name
done