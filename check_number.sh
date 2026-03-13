#!/bin/bash

echo "Choose a number of your choice"
read -p "Enter number: " number

if [ $number -eq 0 ]; then 
	echo "number is zero"
elif [ $number -gt 0 ]; then
	echo "number is positive"
else
	echo "number is negative"
fi

