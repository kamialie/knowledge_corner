#!/bin/sh

# check if jq is installed
if ! command -v jq > /dev/null 2>&1; then
	echo "please install jq tool"
	exit 1
fi

#check if file path is specified
if [[ $# != 1 ]]; then
	echo "Please, specify the path to a JSON file as the only argument"
fi

echo '.id","created_at","name","has_test","alternate_url"' > hh.csv
cat $1 | jq -r -f filter.jq >> hh.csv
