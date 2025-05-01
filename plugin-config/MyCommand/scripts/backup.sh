#!/usr/bin/env bash

set -e

SERVICE_NAME="minecraft-server"
BACKUP_DIR="/backups"
SOURCE_DIR="/data"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="$SERVICE_NAME-backup-$TIMESTAMP.tar.gz"

echo "[*] Starting in-container backup: $BACKUP_NAME"

rcon-cli save-off
rcon-cli save-all flush

tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

rcon-cli save-on

echo "[✓] Backup completed: $BACKUP_NAME"
