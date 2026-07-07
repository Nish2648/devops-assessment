#!/bin/bash

BACKUP_DIR="backups"

mkdir -p $BACKUP_DIR

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

docker exec devops-postgres pg_dump \
-U postgres \
-d appdb \
> "$BACKUP_DIR/backup_$TIMESTAMP.sql"

echo "Backup completed:"
echo "$BACKUP_DIR/backup_$TIMESTAMP.sql"