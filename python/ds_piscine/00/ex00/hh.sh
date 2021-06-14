#!/bin/sh

# check if jq is installed
if ! command -v jq > /dev/null 2>&1; then
	echo "please install jq tool"
	exit 1
fi

read -p "Please, specify the name of a vacancy: " vacancy

BASE_URL="https://api.hh.ru"

PAGE=0
PER_PAGE=20

curl -X GET ${BASE_URL}/vacancies \
	--data-urlencode "page=${PAGE}" \
	--data-urlencode "per_page=${PER_PAGE}" \
	--data-urlencode "text=${vacancy}" | jq > hh.json
