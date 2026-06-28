#!/usr/bin/env bash

run_backup() {
  log_info "Starting Scripts Backup"
  if [ ! -d "$BACKUP_SOURCE" ]; then
    log_error "Backup source does not exist: $BACKUP_SOURCE"
    echo "Backup source does not exist: $BACKUP_SOURCE"
    return 1
  fi
  DATE_NOW=$(date +"%Y-%m-%d_%H-%M-%S")
  BACKUP_FILE="$BACKUP_DIR/backup_$DATE_NOW.tar.gz"

  tar -czf "$BACKUP_FILE" "$BACKUP_SOURCE" 2>/dev/null || {
    log_error "Backup Failed"
    echo "Backup Failed"
    return 1
  }
  log_info "Backup created: $BACKUP_FILE"
  echo "Backup created: $BACKUP_FILE"
  echo "Last Success Backup: $(ls -lh ./backups | tail -n1 | awk '{print $9}')"
}