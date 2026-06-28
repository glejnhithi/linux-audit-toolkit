#!/usr/bin/env bash

init_project() {
  mkdir -p "$REPORT_DIR" "$BACKUP_DIR" "$LOG_DIR"
  touch "$LOG_FILE"
  log_info "Project initialized"
}

log_info() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] $1 " | tee -a "$LOG_FILE"
}

log_warn() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') [WARN] $1 " | tee -a "$LOG_FILE"
}

log_error() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1 " | tee -a "$LOG_FILE"
}

command_exists() {
  command -v "$1" >/dev/null 2&1
}