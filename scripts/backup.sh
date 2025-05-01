#!/usr/bin/env bash

set -e


SERVICE_NAME="minecraft-server"
SCRIPT_PATH="/data/plugins/MyCommand/scripts/backup.sh"

echo "[*] Starting host-triggered backup via $SERVICE_NAME..."
MSYS_NO_PATHCONV=1 docker-compose exec "$SERVICE_NAME" "$SCRIPT_PATH"
