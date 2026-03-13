#!/bin/bash

set -eu

SOURCE_DIR="$1"
BACKUP_DEST="$2"
DATE=$(date +%Y-%m-%d)
ARCHIVE_NAME="backup-$DATE.tar.gz"

if [ $# -ne 2 ]; then
  echo "Usage: $0 <source_directory> <backup_destination>"
  exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory $SOURCE_DIR does not exist."
  exit 1
fi

mkdir -p "$BACKUP_DEST"

echo "Starting backup of $SOURCE_DIR..."

tar -czf "$BACKUP_DEST/$ARCHIVE_NAME" -C "$SOURCE_DIR" .

if [ -f "$BACKUP_DEST/$ARCHIVE_NAME" ]; then
  SIZE=$(du -h "$BACKUP_DEST/$ARCHIVE_NAME" | awk '{print $1}')
  echo "Backup successful"
  echo "Archive Name: $ARCHIVE_NAME"
  echo "Archive Size:    $SIZE"
else
  echo "Error: Archive file not created."
  exit 1
fi

echo "Deleting backups older than 14 days..."
find "$BACKUP_DEST" -name "backup-*.tar.gz" -type f -mtime +14 -delete

echo "Done."
