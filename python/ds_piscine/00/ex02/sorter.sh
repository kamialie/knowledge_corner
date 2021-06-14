#!/bin/sh

#check if file path is specified
if [[ $# != 1 ]]; then
	echo "Please, specify the path to a csv file as the only argument"
	exit 1
fi

head -n1 $1 > hh_sorted.csv
tail -n+2 $1 | sort --field-separator=',' -k2,2 -k1,1 >> hh_sorted.csv
