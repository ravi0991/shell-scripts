#!/bin/bash

read -p "Enter a number to start the countdown: " count

echo "Starting countdown from $number to 0:"

while (( count >=0 ))
do
        echo "$count"
        (( count -- ))
done

echo "Done!"
