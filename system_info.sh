#!/bin/bash
set -euo pipefail
function1() {
hostname

cat /etc/redhat-release
}

function2() {
uptime | awk {'print $1,$2,$3'}
}

function3() {
du -ahd 1 / 2>/dev/null | sort -hr | head -n 5 || true
}

function4() {
free -h | awk 'NR==2 {print $3}'
}

function5() {
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}

echo "hostname and OS info of server is: "
function1

echo "uptime of server is: "
function2

echo "disk usage(top 5) is: "
function3

echo "memory usage is:"
function4

echo "top 5 CPU consuming processes are: "
function5
