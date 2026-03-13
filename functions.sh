#!/bin/bash

greet() {
NAME="$1"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <name>"
  exit 1
fi

echo "Hello, $NAME!"
}

add() {
num1="$1"
num2="$2"
sum=$((num1 + num2))

echo "The sum of $num1 and $num2 is $sum"
}

echo "Calling function greet using name Ravi: "
greet Ravi

echo "Calling function add by using numbers 5 10: "
add 5 10
