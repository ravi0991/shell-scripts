#!/bin/bash

echo "Enter the file name"
read -p "file name: " file_name

if [ -f $file_name ]; then
	echo "$file_name exists"
else
	echo "$file_name does not exist"
fi
