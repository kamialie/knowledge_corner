#!/bin/sh

#check if file path is specified
if [[ $# != 1 ]]; then
	echo "usage: ./sorter.sh path_to_csv_file"
	exit 1
fi

head -n1 $1 > hh_sorted.csv
tail -n+2 $1 | sort --field-separator=',' -k2,2 -k1,1 >> hh_sorted.csv
