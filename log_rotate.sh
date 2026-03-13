#!/bin/bash

log_dir="$1"

if [ $# -ne 1 ]; then
	echo "Usage: $0 <log_directory>"
	exit 1
fi

if [ ! -d "$log_dir" ]; then
	echo "Directory $log_dir not found"
	exit 1
fi

echo "Starting log rotation in: $LOG_DIR"

compress_count=$(find "$log_dir" -name "*.log" -type f -mtime +7 | wc -l)
find "$log_dir" -name "*.log" -type f -mtime +7 -exec gzip {} \;

delete_count=$(find "$log_dir" -name "*.gz" -type f -mtime +30 | wc -l)
find "$log_dir" -name "*.gz" -type f -mtime +30 -exec rm -rf {} \;

echo "Files Compressed: $compress_count"
echo "Files Deleted: $delete_count"
