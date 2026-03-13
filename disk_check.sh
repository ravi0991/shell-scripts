#!/bin/bash

check_disk() {
df -h / | awk 'NR==2 {print $3}'
}

check_memory() {
free -h | awk 'NR==2 {print $3}'
}

echo "disk usage of / is: "
check_disk

echo "free memory is: "
check_memory
