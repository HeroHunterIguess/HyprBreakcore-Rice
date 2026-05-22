#!/bin/bash

current_num=0
current_binary=""

convert() {
    local output=()
    local loc_num=$current_num

    while (( loc_num > 0 )); do
        output+=($((loc_num%2)))

        if ((loc_num > 0)); then
            ((loc_num=$loc_num/2))
        fi
    done

    current_binary=${output[4]}${output[3]}${output[2]}${output[1]}${output[0]}

    if (( current_num == 0)); then
        current_binary=00000
    elif (( current_num < 2 )); then
        current_binary=(0000$current_binary)
    elif (( current_num < 4 )); then
        current_binary=(000$current_binary)
    elif (( current_num < 8 )); then
        current_binary=(00$current_binary)
    elif (( current_num < 16 )); then
        current_binary=(0$current_binary)
    fi
}

while true; do
    convert

    echo $current_binary

    ((current_num++))

    if (( current_num > 31 )); then
        current_num=0
    fi

    sleep 0.2
done
