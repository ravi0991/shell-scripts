#!/bin/bash

NAME="$1"

if [ $# -lt 1 ]; then
	echo "Usage: $0 No argument provided. Provide at least 1 argument"
	echo "Example: $0 Sanjay"
	exit 1
fi

echo "Hello, $NAME!"
