#!/bin/bash

paused=$(dunstctl is-paused)

if [[ "$paused" == true ]]; then
  echo "⚪"
elif [[ "$paused" == false ]]; then
  echo ""
fi
