#!/bin/sh

# METHOD - GET, POST, etc
# URL - url without hostname
# JSON - .json file that represents the body of request (optional)
# curl METHOD URL

# Install jq tool for pretty output, then set JQ to true, default is false

# example
# ./request.sh GET /shakespeare/_search?pretty data.json
# ./request.sh GET /_cluster/health

ES_HOST=localhost
ES_PORT=9200

JQ=true

if [[ $3 == "" ]]; then
  DATA=""
else
  DATA="--data-binary @$3"
fi

if [[ $JQ == true ]]; then
  curl -H "Content-Type: application/json" -X $1 $ES_HOST:$ES_PORT$2 $DATA | jq
else
  curl -H "Content-Type: application/json" -X $1 $ES_HOST:$ES_PORT$2 $DATA
fi
