#!/bin/bash

API_KEY=""
CITY=""
UNITS="Imperial"

weather=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?q=${CITY}&units=${UNITS}&appid=${API_KEY}")
if [ ! -z "$weather" ]; then
    temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    echo "${temp}°F"
else
    echo "N/A"
fi
