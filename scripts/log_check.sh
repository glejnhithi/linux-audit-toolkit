#!/usr/bin/env bash

check_system_logs() {
  log_info "Checking system logs"
  OUTPUT="$REPORT_DIR/log_check.txt"

  if [ -f /var/log/syslog ]; then
    SYSTEM_LOG="/var/log/syslog"
  elif [ -f /var/log/messages ]; then
    SYSTEM_LOG="/var/log/messages"
  else
    SYSTEM_LOG=""
  fi
  {
    echo "===== LOG CHECK ====="

    if [ -z "$SYSTEM_LOG" ]; then
      echo "No supported system log file found "
    else
      echo "Using log file: $SYSTEM_LOG"
      echo
      echo "Last 20 errors/warnings:"
      grep -aEi "error|failed|warning|critical" "$SYSTEM_LOG" | tail -n 20 || echo "No errors found"
    fi
  } > "$OUTPUT"

  echo "Log check saved to $OUTPUT"
  cat "$OUTPUT"
}