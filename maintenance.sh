#!/bin/bash

set -eu

LOG_FILE="/var/log/maintenance.log"
SOURCE_DIR="/logs"
BACKUP_DEST="/var/backups"
LOG_DIR="/var/log/nginx"

rotate_logs() {
  echo "Rotating logs in $LOG_DIR..."
  find "$LOG_DIR" -name "*.log" -type f -mtime +7 -exec gzip {} \;
  find "$LOG_DIR" -name "*.gz" -type f -mtime +30 -delete
  echo "Log rotation complete."
}

backup() {
 local date=$(date +%Y-%m-%d)
 local archive="backup-$date.tar.gz"

  echo "Backing up $SOURCE_DIR to $BACKUP_DEST..."
  mkdir -p "$BACKUP_DEST"

  if [ -d "$SOURCE_DIR" ]; then
    tar -zcf "$BACKUP_DEST/$archive" -C "$SOURCE_DIR" .
    echo "Backup saved as $archive ($(du -h "$BACKUP_DEST/$archive" | awk '{print $1}'))"

    find "$BACKUP_DEST" -name "backup-*.tar.gz" -mtime +14 -delete
    echo "Old backup cleanup complete."
  else
    echo "Error: Source directory $SOURCE_DIR not found!"
    exit 1
  fi
}

main() {
  if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE" 2>/dev/null || { echo "Error: Cannot create $LOG_FILE. Run as sudo?"; exit 1; }
  fi

  {
    echo "MAINTENANCE START: $(date)"

    rotate_logs
    echo ""
    backup

    echo "MAINTENANCE END: $(date)"
    echo ""
  } >> "$LOG_FILE" 2>&1
}

main
