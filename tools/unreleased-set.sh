#!/bin/bash

if [ -z "${1}" ]; then
    echo "usage: ./unreleased-set.sh <set_id>"
    exit 1
fi

echo "Downloading stuff for set '$1'"
curl "https://api.pokemontcg.io/v2/cards?q=set.id:$1" | jq '.data' | jq 'del(.[] .tcgplayer, .[] .cardmarket)' >"$1.json"

