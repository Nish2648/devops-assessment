#!/bin/bash

LATEST_BACKUP=$(ls -t backups/*.sql | head -1)

echo "Restoring: $LATEST_BACKUP"

docker exec -i devops-postgres psql \
-U postgres \
-d appdb \
< "$LATEST_BACKUP"

echo "Restore completed."