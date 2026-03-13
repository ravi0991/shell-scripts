#!/bin/bash

set -euo pipefail

# Task 1: Input and Validation
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_log_file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

REPORT_DATE=$(date +%Y-%m-%d)
REPORT_FILE="log_report_${REPORT_DATE}.txt"
TOTAL_LINES=$(wc -l < "$LOG_FILE")

# Task 2: Error Count
ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOG_FILE" | wc -l)

# Task 3: Critical Events 
CRITICAL_EVENTS=$(grep -n "CRITICAL" "$LOG_FILE" | sed 's/^/Line /; s/:/ : /')

# Task 4: Top Error Messages
TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" | awk '{$1=$2=$3=""; print $0}' | sed 's/^[ \t]*//' | sort | uniq -c | sort -rn | head -5)

# Task 5: Summary Report
{
    echo "==========================================="
    echo "      LOG ANALYSIS REPORT - $REPORT_DATE"
    echo "==========================================="
    echo "Log File:         $LOG_FILE"
    echo "Total Lines:      $TOTAL_LINES"
    echo "Total Errors:     $ERROR_COUNT"
    echo ""
    echo "--- Top 5 Error Messages ---"
    echo "$TOP_ERRORS"
    echo ""
    echo "--- Critical Events ---"
    if [ "$CRITICAL_EVENTS" == "None found" ]; then
        echo "No critical events found."
    else
        echo "$CRITICAL_EVENTS" | while read -r line; do
            echo "Line ${line}"
        done
    fi
} > "$REPORT_FILE"

# Print results to console as well
echo "Analysis Complete. Total Errors found: $ERROR_COUNT"
echo "Report generated: $REPORT_FILE"

# Task 6: Archive Processed Logs 
mkdir -p archive
mv "$LOG_FILE" archive/
echo "'$LOG_FILE' moved to archive/ directory."
