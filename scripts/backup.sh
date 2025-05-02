#!/usr/bin/env bash

set -e

# Config
SERVICE_NAME="minecraft-server"
BACKUP_DIR="./backups"
SOURCE_DIR="./data"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="$SERVICE_NAME-backup-$TIMESTAMP.tar.gz"
RCON_CMD="docker compose exec $SERVICE_NAME rcon-cli"

# Step 1: Flush world to disk and disable saves
echo "[*] Flushing world and disabling saving..."
$RCON_CMD save-all flush
sleep 2
$RCON_CMD save-off

# Step 2: Create backup
echo "[*] Backing up data..."
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Step 3: Re-enable saving
echo "[*] Re-enabling saving..."
$RCON_CMD save-on

echo "[✓] Backup complete: $BACKUP_DIR/$BACKUP_NAME"
