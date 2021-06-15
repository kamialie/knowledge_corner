#!/bin/sh

#check if file path is specified
if [[ $# != 1 ]]; then
	echo "usage: ./counter.sh path_to_csv_file"
	exit 1
fi

tail -n+2 $1 | grep -e Senior -e Middle -e Junior | cut -d, -f3 | sort | uniq -c | sed -r 's/ *//' | sed -r 's/([0-9]+) (.*)/\2,\1/' | sort -t, -k2 -nr > hh_uniq_positions.csv
